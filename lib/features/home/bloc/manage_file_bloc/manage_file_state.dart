part of 'manage_file_bloc.dart';

enum ManageFileStatus { initial, loading, loaded, error }

enum FileFilter {
  all,
  melsave,
  melworld,
  melmod,
  melmap;

  String get label => switch (this) {
    FileFilter.all => 'All Files',
    _ => '.$name',
  };
}

@freezed
abstract class ManageFileState with _$ManageFileState {
  const factory ManageFileState({
    @Default(ManageFileStatus.initial) ManageFileStatus status,
    @Default(FileFilter.all) FileFilter activeFilter,
    @Default('') String searchQuery,
    @Default([]) List<UserFileData> displayedFiles,
    @Default([]) List<UserFileData> existingFiles,
    @Default('') String errorMessage,
  }) = _ManageFileState;
}
