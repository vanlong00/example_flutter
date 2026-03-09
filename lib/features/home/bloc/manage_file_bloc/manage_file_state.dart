part of 'manage_file_bloc.dart';

enum ManageFileStatus { initial, loading, loaded, error }

@freezed
abstract class ManageFileState with _$ManageFileState {
  const factory ManageFileState({
    @Default(ManageFileStatus.initial) ManageFileStatus status,
    @Default([]) List<UserFileData> displayedFiles,
    @Default([]) List<UserFileData> existingFiles,
    @Default('') String errorMessage,
  }) = _ManageFileState;
}
