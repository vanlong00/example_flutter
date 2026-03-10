part of 'explorable_bloc.dart';

enum ManageFileStatus { initial, loading, loaded }

@freezed
abstract class ExplorableState with _$ExplorableState {
  const factory ExplorableState({required ExplorableNode tree, @Default(ManageFileStatus.initial) ManageFileStatus status}) = _ExplorableState;
}
