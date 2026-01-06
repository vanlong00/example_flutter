part of 'manage_file_bloc.dart';

@freezed
class ManageFileEvent with _$ManageFileEvent {
  const factory ManageFileEvent.pickFile() = _PickFile;
  const factory ManageFileEvent.clearFile() = _ClearFile;
  const factory ManageFileEvent.removeFile(int index) = _RemoveFile;
}
