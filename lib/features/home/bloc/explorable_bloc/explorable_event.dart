part of 'explorable_bloc.dart';

@freezed
abstract class ExplorableEvent with _$ExplorableEvent {
  const factory ExplorableEvent.started() = _Started;
  const factory ExplorableEvent.pickFile() = _PickFile;
  const factory ExplorableEvent.shareFile({required String filePath}) = _ShareFile;
  const factory ExplorableEvent.removeFile({required Explorable item}) = _RemoveFile;
  const factory ExplorableEvent.removeAll() = _RemoveAll;
}
