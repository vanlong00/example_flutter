import 'package:example/data/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// A breadcrumb entry: the folder's path (used as key for lookup) and
/// its display name.
typedef BreadcrumbEntry = ({String path, String name});

class BrowserCubit extends Cubit<List<BreadcrumbEntry>> {
  BrowserCubit() : super(const []);

  void navigateInto(ExplorableFolder folder) =>
      emit([...state, (path: folder.path, name: folder.name)]);

  /// [index] = -1 → navigate to root (clear all).
  void navigateTo(int index) =>
      emit(index < 0 ? const [] : state.sublist(0, index + 1));

  void resetToRoot() => emit(const []);

  /// After a deletion, pops any breadcrumb entries whose folder no longer
  /// exists in [rootItems].
  void validatePath(List<Explorable> rootItems) {
    final validDepth = _findValidDepth(rootItems, state);
    if (validDepth < state.length) emit(state.sublist(0, validDepth));
  }

  /// Returns the children of the currently active folder.
  List<Explorable> currentChildren(List<Explorable> rootItems) =>
      _findChildren(rootItems, state.map((e) => e.path).toList());

  // ── Private helpers ──────────────────────────────────────────────────────

  int _findValidDepth(List<Explorable> items, List<BreadcrumbEntry> path) {
    if (path.isEmpty) return 0;
    final folder = items.whereType<ExplorableFolder>().where((f) => f.path == path.first.path).firstOrNull;
    if (folder == null) return 0;
    return 1 + _findValidDepth(folder.children, path.sublist(1));
  }

  List<Explorable> _findChildren(List<Explorable> items, List<String> paths) {
    if (paths.isEmpty) return items;
    final folder = items.whereType<ExplorableFolder>().where((f) => f.path == paths.first).firstOrNull;
    if (folder == null) return [];
    return _findChildren(folder.children, paths.sublist(1));
  }
}
