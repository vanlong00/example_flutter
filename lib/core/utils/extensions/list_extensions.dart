extension ListExtensions<T> on List<T> {
  T? get firstOrNull => isEmpty ? null : first;
  T? get lastOrNull => isEmpty ? null : last;

  List<T> distinctBy<K>(K Function(T) keySelector) {
    final seen = <K>{};
    return where((element) => seen.add(keySelector(element))).toList();
  }

  List<List<T>> chunk(int size) {
    final chunks = <List<T>>[];
    for (var i = 0; i < length; i += size) {
      chunks.add(sublist(i, i + size > length ? length : i + size));
    }
    return chunks;
  }

  List<T> sortedBy<K extends Comparable>(K Function(T) keySelector) {
    final copy = [...this];
    copy.sort((a, b) => keySelector(a).compareTo(keySelector(b)));
    return copy;
  }

  List<T> sortedByDescending<K extends Comparable>(K Function(T) keySelector) {
    final copy = [...this];
    copy.sort((a, b) => keySelector(b).compareTo(keySelector(a)));
    return copy;
  }

  Iterable<T> intersperse(T separator) sync* {
    for (var i = 0; i < length; i++) {
      yield this[i];
      if (i < length - 1) yield separator;
    }
  }
}

extension IterableExtensions<T> on Iterable<T> {
  T? firstWhereOrNull(bool Function(T) test) {
    for (final element in this) {
      if (test(element)) return element;
    }
    return null;
  }

  Map<K, List<T>> groupBy<K>(K Function(T) keySelector) {
    final map = <K, List<T>>{};
    for (final element in this) {
      map.putIfAbsent(keySelector(element), () => []).add(element);
    }
    return map;
  }
}
