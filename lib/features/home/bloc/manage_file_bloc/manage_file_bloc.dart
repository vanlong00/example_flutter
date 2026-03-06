import 'dart:io';

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
  final List<UserFileData> _storedFiles = [];

  ManageFileBloc() : super(const ManageFileState()) {
    on<_PickFile>(_onPickFile);
    on<_ClearFile>(_onClearFile);
    on<_RemoveFile>(_onRemoveFile);
    on<_Initialize>(_onInitialize);
    on<_SearchChanged>(_onSearchChanged);
    on<_FilterChanged>(_onFilterChanged);

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
    emit(state.copyWith(status: ManageFileStatus.loading));

    final dirStorage = await StorageHelper.getCacheDirectoryApp();
    final List<UserFileData> storedFiles = [];
    await for (final file in dirStorage.list()) {
      final File savedFile = File(file.path);
      final Uint8List bytes = await savedFile.readAsBytes();
      final userFileData = UserFileData.create(fileName: p.basename(file.path), bytes: bytes, path: savedFile.path);
      storedFiles.add(userFileData);
    }

    _storedFiles
      ..clear()
      ..addAll(storedFiles);
    emit(state.copyWith(status: ManageFileStatus.loaded, displayedFiles: List.from(_storedFiles), existingFiles: []));
  }

  Future<void> _onPickFile(_PickFile event, Emitter<ManageFileState> emit) async {
    emit(state.copyWith(status: ManageFileStatus.loading, existingFiles: state.displayedFiles));

    try {
      final result = await FileHelper.selectFileFormat();
      _storedFiles.addAll(result);
      emit(
        state.copyWith(
          status: ManageFileStatus.loaded,
          displayedFiles: _computeDisplayedFiles(state.activeFilter, state.searchQuery),
          existingFiles: [],
        ),
      );
    } catch (e) {
      debugPrint('ManageFileBloc _onPickFile error: $e');
      emit(state.copyWith(status: ManageFileStatus.error, errorMessage: 'Failed to pick file'));
    }
  }

  // Future<void> processBytes(Emitter<ManageFileState> emit, List<UserFileData> files) async {
  //   await state.mapOrNull(
  //     loaded: (value) async {
  //       final filesToProcess = value.files.where((f) => f.melon == null && p.extension(f.path ?? '') == '.melmod').toList();

  //       // Process files in isolate
  //       for (final fileData in filesToProcess) {
  //         try {
  //           if (fileData.path == null) continue;
  //           final melonBase = await _isolate.processFile(fileData.path!);

  //           // Get fresh state to avoid overwriting user actions
  //           final freshState = state.mapOrNull(loaded: (s) => s);
  //           if (freshState == null) return;

  //           // Check if file still exists in current state
  //           final fileStillExists = freshState.files.any((f) => f.id == fileData.id);
  //           if (!fileStillExists) continue;

  //           final updatedFile = fileData.copyWith(melon: melonBase);
  //           final updatedFiles = freshState.files.map((f) => f.id == updatedFile.id ? updatedFile : f).toList();

  //           emit(ManageFileState.loaded(files: updatedFiles));
  //         } catch (e) {
  //           debugPrint('Failed to process ${fileData.fileName}: $e');
  //         }
  //       }
  //     },
  //   );
  // }

  void _onClearFile(_ClearFile event, Emitter<ManageFileState> emit) {
    _storedFiles.clear();
    FileHelper.clearTemporaryFiles();
    emit(const ManageFileState());
  }

  void _onRemoveFile(_RemoveFile event, Emitter<ManageFileState> emit) {
    _storedFiles.removeAt(event.index);
    if (_storedFiles.isEmpty) {
      emit(const ManageFileState());
    } else {
      emit(state.copyWith(status: ManageFileStatus.loaded, displayedFiles: _computeDisplayedFiles(state.activeFilter, state.searchQuery)));
    }
  }

  void _onSearchChanged(_SearchChanged event, Emitter<ManageFileState> emit) {
    emit(state.copyWith(searchQuery: event.query, displayedFiles: _computeDisplayedFiles(state.activeFilter, event.query)));
  }

  void _onFilterChanged(_FilterChanged event, Emitter<ManageFileState> emit) {
    emit(state.copyWith(activeFilter: event.filter, displayedFiles: _computeDisplayedFiles(event.filter, state.searchQuery)));
  }

  List<UserFileData> _computeDisplayedFiles(FileFilter filter, String query) {
    var result = List<UserFileData>.from(_storedFiles);
    if (filter != FileFilter.all) {
      result = result.where((f) => f.type?.name == filter.name).toList();
    }
    if (query.isNotEmpty) {
      final lower = query.toLowerCase();
      result = result.where((f) => (f.fileName ?? '').toLowerCase().contains(lower)).toList();
    }
    return result;
  }

  @override
  Future<void> close() async {
    await _isolate.shutdown();
    return super.close();
  }
}
