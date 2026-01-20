import 'package:example/core/core.dart';
import 'package:example/core/isolates/file_process_isolate.dart';
import 'package:example/core/utils/helpers/storage_helper.dart';
import 'package:example/data/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;

part 'manage_file_event.dart';
part 'manage_file_state.dart';
part 'manage_file_bloc.freezed.dart';

class ManageFileBloc extends Bloc<ManageFileEvent, ManageFileState> {
  final _isolate = FileProcessingIsolate();

  ManageFileBloc() : super(const ManageFileState.initial()) {
    on<_PickFile>(_onPickFile);
    on<_ClearFile>(_onClearFile);
    on<_RemoveFile>(_onRemoveFile);
    on<_Initialize>(_onInitialize);

    _initializeIsolate();
    add(const ManageFileEvent.initialize());
  }

  Future<void> _initializeIsolate() async {
    try {
      await _isolate.initialize();
    } catch (e) {
      debugPrint('Failed to initialize isolate: $e');
    }
  }

  Future<void> _onInitialize(_Initialize event, Emitter<ManageFileState> emit) async {
    emit(const ManageFileState.loading());

    final dirStorage = await StorageHelper.getCacheDirectoryApp();
    final List<UserFileData> storedFiles = [];
    dirStorage.listSync().forEach((file) {
      final userFileData = UserFileData.fromPath(file.path);
      storedFiles.add(userFileData);
    });

    emit(ManageFileState.loaded(files: storedFiles));
    await processBytes(emit);
  }

  Future<void> _onPickFile(_PickFile event, Emitter<ManageFileState> emit) async {
    final currentFiles = state.maybeWhen(loaded: (files) => files, orElse: () => <UserFileData>[]);
    emit(const ManageFileState.loading());

    try {
      final result = await FileHelper.selectFileFormat();
      emit(ManageFileState.loaded(files: [...currentFiles, ...result]));
    } catch (e) {
      debugPrint('ManageFileBloc _onPickFile error: $e');
      emit(ManageFileState.error('Failed to pick file'));
    }

    await processBytes(emit);
  }

  Future<void> processBytes(Emitter<ManageFileState> emit) async {
    await state.mapOrNull(
      loaded: (value) async {
        final filesToProcess = value.files.where((f) => f.melon == null && p.extension(f.path ?? '') == '.melmod').toList();

        // Process files in isolate
        for (final fileData in filesToProcess) {
          // Check if event handler is done before processing
          if (emit.isDone) return;

          try {
            if (fileData.path == null) continue;
            final melonBase = await _isolate.processFile(fileData.path!);
            // Check again after async operation
            if (emit.isDone) return;

            // Get fresh state to avoid overwriting user actions
            final freshState = state.mapOrNull(loaded: (s) => s);
            if (freshState == null) return;

            // Check if file still exists in current state
            final fileStillExists = freshState.files.any((f) => f.id == fileData.id);
            if (!fileStillExists) continue;

            final updatedFile = fileData.copyWith(melon: melonBase);
            final updatedFiles = freshState.files.map((f) => f.id == updatedFile.id ? updatedFile : f).toList();

            emit(ManageFileState.loaded(files: updatedFiles));
          } catch (e) {
            debugPrint('Failed to process ${fileData.fileName}: $e');
          }
        }
      },
    );
  }

  void _onClearFile(_ClearFile event, Emitter<ManageFileState> emit) {
    FileHelper.clearTemporaryFiles();
    emit(const ManageFileState.initial());
  }

  void _onRemoveFile(_RemoveFile event, Emitter<ManageFileState> emit) {
    state.maybeWhen(
      loaded: (files) {
        final updatedFiles = List<UserFileData>.from(files)..removeAt(event.index);
        if (updatedFiles.isEmpty) {
          emit(const ManageFileState.initial());
        } else {
          emit(ManageFileState.loaded(files: updatedFiles));
        }
      },
      orElse: () {},
    );
  }

  @override
  Future<void> close() async {
    await _isolate.shutdown();
    return super.close();
  }
}
