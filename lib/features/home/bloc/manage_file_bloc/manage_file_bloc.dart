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
    try {
      final dirStorage = await StorageHelper.getCacheDirectoryApp();
      final List<UserFileData> storedFiles = [];
      final List<FileSystemEntity> files = await dirStorage.list().toList();
      if (files.isEmpty) {
        emit(state.copyWith(status: ManageFileStatus.initial));
        return;
      }
      for (final file in files) {
        final File savedFile = File(file.path);
        final Uint8List bytes = await savedFile.readAsBytes();
        final userFileData = UserFileData.create(fileName: p.basename(file.path), bytes: bytes, path: savedFile.path);
        storedFiles.add(userFileData);
      }

      _storedFiles
        ..clear()
        ..addAll(storedFiles);
      emit(state.copyWith(status: ManageFileStatus.loaded, displayedFiles: List.from(_storedFiles), existingFiles: []));
    } catch (e) {
      emit(state.copyWith(status: ManageFileStatus.error, errorMessage: 'There are some problems in accessing stored files'));
    }
  }

  Future<void> _onPickFile(_PickFile event, Emitter<ManageFileState> emit) async {
    emit(state.copyWith(status: ManageFileStatus.loading, existingFiles: state.displayedFiles));

    try {
      final result = await FileHelper.selectFileFormat();
      _storedFiles.addAll(result);
      emit(state.copyWith(status: ManageFileStatus.loaded, displayedFiles: List.from(_storedFiles), existingFiles: []));
    } catch (e) {
      debugPrint('ManageFileBloc _onPickFile error: $e');
    }
  }

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
      emit(state.copyWith(status: ManageFileStatus.loaded, displayedFiles: List.from(_storedFiles)));
    }
  }

  @override
  Future<void> close() async {
    await _isolate.shutdown();
    return super.close();
  }
}
