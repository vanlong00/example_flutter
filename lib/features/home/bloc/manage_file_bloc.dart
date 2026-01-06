import 'package:example/core/core.dart';
import 'package:example/data/models/picked_file_data/picked_file_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'manage_file_event.dart';
part 'manage_file_state.dart';
part 'manage_file_bloc.freezed.dart';

class ManageFileBloc extends Bloc<ManageFileEvent, ManageFileState> {
  ManageFileBloc() : super(const ManageFileState.initial()) {
    on<_PickFile>(_onPickFile);
    on<_ClearFile>(_onClearFile);
    on<_RemoveFile>(_onRemoveFile);
  }

  Future<void> _onPickFile(_PickFile event, Emitter<ManageFileState> emit) async {
    final currentFiles = state.maybeWhen(loaded: (files) => files, orElse: () => <PickedFileData>[]);

    emit(const ManageFileState.loading());

    try {
      final result = await FileHelper.pickFileAsBytes();

      if (result != null) {
        final newFile = PickedFileData.create(fileName: result.fileName, bytes: result.bytes);
        emit(ManageFileState.loaded(files: [...currentFiles, newFile]));
      } else {
        emit(ManageFileState.loaded(files: currentFiles));
      }
    } catch (e) {
      emit(ManageFileState.error('Failed to pick file: $e'));
    }
  }

  void _onClearFile(_ClearFile event, Emitter<ManageFileState> emit) {
    emit(const ManageFileState.initial());
  }

  void _onRemoveFile(_RemoveFile event, Emitter<ManageFileState> emit) {
    state.maybeWhen(
      loaded: (files) {
        final updatedFiles = List<PickedFileData>.from(files)..removeAt(event.index);
        if (updatedFiles.isEmpty) {
          emit(const ManageFileState.initial());
        } else {
          emit(ManageFileState.loaded(files: updatedFiles));
        }
      },
      orElse: () {},
    );
  }
}
