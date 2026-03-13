import 'package:flutter/material.dart';

/// Holds all [GlobalKey] instances used by [Showcase] widgets throughout the app.
///
/// Keys are declared as singletons here so that both the page that renders
/// the [Showcase] wrapper and the page that calls [startShowCase] can share the
/// exact same key instances.
abstract final class TutorialKeys {
  static final GlobalKey addFile = GlobalKey(debugLabel: 'showcase_add_file');
  static final GlobalKey collapseAll = GlobalKey(debugLabel: 'showcase_collapse_all');

  /// Ordered list of keys that defines the tutorial step sequence.
  static List<GlobalKey> get orderedKeys => [addFile, collapseAll];
}
