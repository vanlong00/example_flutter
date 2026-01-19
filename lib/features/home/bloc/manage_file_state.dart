part of 'manage_file_bloc.dart';

@freezed
abstract class ManageFileState with _$ManageFileState {
  const factory ManageFileState.initial() = _Initial;
  const factory ManageFileState.loading() = _Loading;
  const factory ManageFileState.loaded({required List<UserFileData> files}) = _Loaded;
  const factory ManageFileState.error(String message) = _Error;
}
