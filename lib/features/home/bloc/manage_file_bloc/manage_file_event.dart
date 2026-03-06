part of 'manage_file_bloc.dart';

@freezed
abstract class ManageFileEvent with _$ManageFileEvent {
  const factory ManageFileEvent.pickFile() = _PickFile;
  const factory ManageFileEvent.clearFile() = _ClearFile;
  const factory ManageFileEvent.removeFile(int index) = _RemoveFile;
  const factory ManageFileEvent.initialize() = _Initialize;
  const factory ManageFileEvent.searchChanged(String query) = _SearchChanged;
  const factory ManageFileEvent.filterChanged(FileFilter filter) = _FilterChanged;
}
