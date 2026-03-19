part of 'explorable_bloc.dart';

enum ManageFileStatus { initial, loading, loaded }

@freezed
abstract class ExplorableState with _$ExplorableState {
  const factory ExplorableState({@Default([]) List<Explorable> items, @Default(ManageFileStatus.initial) ManageFileStatus status}) = _ExplorableState;
}
