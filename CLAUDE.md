# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Code Generation

```bash
# Install dependencies
flutter pub get

# Generate freezed models, flutter_gen assets (run after adding/modifying @freezed classes or assets)
flutter pub run build_runner build --delete-conflicting-outputs

# Watch mode during development
flutter pub run build_runner watch

# Run the app
flutter run
```

Always run `build_runner build` after adding or modifying any `@freezed` class or asset files.

## Architecture

```
lib/
├── core/          # Cross-cutting: extensions, helpers, isolates, constants, DI
├── data/          # Freezed models, datasources, repositories
├── features/      # Feature modules (each has bloc/, pages/, widgets/)
└── gen/           # ⚠️ Generated — do not edit (flutter_gen assets)

packages/
└── design_system/ # Standalone design token package (theme, spacing, colors, fonts)
```

### Layer Import Rules

| Layer           | May Import                        |
|-----------------|-----------------------------------|
| `core/`         | `design_system`                   |
| `data/`         | `core/`                           |
| `features/`     | `core/`, `data/`, `design_system` |
| `design_system` | Nothing from main app             |

## State Management (BLoC + Freezed)

Events and states are `@freezed` sealed unions. BLoCs are instantiated manually in `main.dart` via `MultiBlocProvider`.

```dart
// event
@freezed
abstract class MyFeatureEvent with _$MyFeatureEvent {
  const factory MyFeatureEvent.doSomething() = _DoSomething;
}

// state
@freezed
abstract class MyFeatureState with _$MyFeatureState {
  const factory MyFeatureState.initial() = _Initial;
  const factory MyFeatureState.loading() = _Loading;
  const factory MyFeatureState.loaded({required List<Item> items}) = _Loaded;
  const factory MyFeatureState.error(String message) = _Error;
}
```

- Provide at page level: `BlocProvider(create: (_) => MyFeatureBloc())`
- Dispatch: `context.read<MyFeatureBloc>().add(const MyFeatureEvent.doSomething())`
- Pattern-match state: `state.when(initial: ..., loading: ..., loaded: ..., error: ...)`
- Use `BlocSelector` instead of `BlocBuilder` when only a derived value is needed

## Design System

Always import via: `import 'package:design_system/design_system.dart';`

### Spacing Tokens

```dart
// Named tokens: xs(4) sm(8) md(16) lg(24) xl(32) x2l(48) x3l(64)
padding: EdgeInsets.all(AppSpacing.md)
padding: AppSpacing.allMd          // EdgeInsets shortcut
padding: AppSpacing.horizontalLg
gap: AppSpacing.gapMd              // SizedBox shortcut
padding: AppSpacing.pagePadding    // Adaptive: 1.25× on tablet — prefer for screen-level padding
```

### Borders & Shape

```dart
borderRadius: AppStyle.borderCard    // 12px
borderRadius: AppStyle.borderButton  // 8px
shape: AppStyle.shapeCard
```

### Context Extensions (from `core/utils`)

```dart
context.textTheme.titleSmall?.semiBold
context.colorScheme.primary
context.semanticColors.success       // AppSemanticColors
context.isDarkMode
context.isMobile / context.isTablet / context.isDesktop  // breakpoints: <600 / 600–1199 / ≥1200
context.push(page)
context.showSnackBar(msg)
```

`context.isTablet` is defined in `core/utils/extensions/context_extensions.dart` — not exported through `design_system`. Import `core/core.dart` in feature pages.

### Type-Safe Assets

Generated into `lib/gen/assets.gen.dart`. Never use string paths.

```dart
Assets.icons.solid.cog.image(width: 20, color: color)
Assets.images.placeholder.image(fit: BoxFit.cover)
```

Add assets in `pubspec.yaml` and re-run `build_runner`.

## Naming Conventions

| Kind                | Convention                  | Example               |
|---------------------|-----------------------------|-----------------------|
| Files               | `snake_case.dart`           | `manage_file_bloc.dart` |
| Classes             | `PascalCase`                | `ManageFileBloc`      |
| BLoC                | `<Feature>Bloc/Event/State` | `ExplorableBloc`      |
| Pages               | `<Feature>Page`             | `HomePage`            |
| Private page widget | `_<Name>View`               | `_HomePageView`       |
| Helpers             | `<Domain>Helper`            | `FileHelper`          |

## Key Pitfalls

- **No business logic in widgets.** All logic belongs in BLoC event handlers.
- **Freezed part files require codegen.** Run `build_runner build` immediately after creating any `@freezed` class.
- **`lib/gen/assets.gen.dart` is generated.** Do not edit manually.
- **Isolates require serializable messages.** Only pass plain/serializable data to `FileProcessingIsolate`.
- **Override `close()` in BLoCs** that hold resources (e.g., an isolate).
- **`design_system` re-exports `sizer` and `device_preview`** — no need to import them separately.
