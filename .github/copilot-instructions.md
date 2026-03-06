# Copilot Instructions — Example Flutter App

## Project Overview

A Flutter application using clean architecture (Core / Data / Features), BLoC state management, `freezed` for sealed models, and a shared `design_system` package.

---

## Build & Code Generation

```bash
# Generate freezed, injectable, and flutter_gen output
flutter pub run build_runner build

# Watch mode during development
flutter pub run build_runner watch

# Clean + rebuild when generators are out of sync
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run
```

> Always run `build_runner build` after adding or modifying any `@freezed`, `@injectable`, or asset files.

---

## Architecture

```
lib/
├── core/          # DI, extensions, helpers, isolates, constants
├── data/          # Freezed models, datasources, repositories
├── features/      # Feature modules (each has bloc/, pages/, widgets/)
└── gen/           # ⚠️ Generated — do not edit (flutter_gen assets)

packages/
└── design_system/ # Standalone design token package (theme, spacing, colors, fonts)
```

### Layer Rules

| Layer           | Responsibility         | May Import                        |
| --------------- | ---------------------- | --------------------------------- |
| `core/`         | Cross-cutting concerns | `design_system`                   |
| `data/`         | Models, serialization  | `core/`                           |
| `features/`     | UI, BLoC state         | `core/`, `data/`, `design_system` |
| `design_system` | Tokens, theme, widgets | Nothing from main app             |

---

## State Management (BLoC + Freezed)

Every feature uses `flutter_bloc`. Events and states are `@freezed` sealed unions.

### Template

```dart
// my_feature_event.dart
part 'my_feature_event.freezed.dart';
@freezed
abstract class MyFeatureEvent with _$MyFeatureEvent {
  const factory MyFeatureEvent.doSomething() = _DoSomething;
}

// my_feature_state.dart
part 'my_feature_state.freezed.dart';
@freezed
abstract class MyFeatureState with _$MyFeatureState {
  const factory MyFeatureState.initial() = _Initial;
  const factory MyFeatureState.loading() = _Loading;
  const factory MyFeatureState.loaded({required List<Item> items}) = _Loaded;
  const factory MyFeatureState.error(String message) = _Error;
}

// my_feature_bloc.dart
class MyFeatureBloc extends Bloc<MyFeatureEvent, MyFeatureState> {
  MyFeatureBloc() : super(const MyFeatureState.initial()) {
    on<MyFeatureEvent>(_onEvent);
  }
}
```

### BLoC in Pages

- Provide at page level: `BlocProvider(create: (_) => MyFeatureBloc())`
- Dispatch: `context.read<MyFeatureBloc>().add(const MyFeatureEvent.doSomething())`
- Pattern-match state: `state.when(initial: ..., loading: ..., loaded: ..., error: ...)`
- Selective rebuilds: `BlocSelector` instead of `BlocBuilder` when only a derived value is needed

---

## Models (Freezed)

```dart
part 'user_file_data.freezed.dart';
part 'user_file_data.g.dart'; // only if using @JsonSerializable

@freezed
abstract class UserFileData with _$UserFileData {
  const factory UserFileData({
    required String id,
    String? fileName,
    @Default(MelType.unknown) MelType type,
  }) = _UserFileData;

  factory UserFileData.fromJson(Map<String, dynamic> json) => _$UserFileDataFromJson(json);
}
```

- Use `@Default(value)` for optional fields rather than nullable where possible.
- Versioned models (e.g., `MelonBase`) use factory variants: `.v2()`, `.v3()`, `.v4()`.

---

## Design System Usage

Always import via the barrel: `import 'package:design_system/design_system.dart';`

### Spacing

```dart
// Named tokens: xs(4) sm(8) md(16) lg(24) xl(32) x2l(48) x3l(64)
padding: EdgeInsets.all(AppSpacing.md)
padding: AppSpacing.allMd            // EdgeInsets shortcut
padding: AppSpacing.horizontalLg
gap: AppSpacing.gapMd                // SizedBox shortcut
// Adaptive (1.25× on tablet) — prefer for screen-level padding
padding: AppSpacing.pagePadding
```

### Border Radius / Shape

```dart
borderRadius: AppStyle.borderCard    // 12px
borderRadius: AppStyle.borderButton  // 8px
shape: AppStyle.shapeCard            // RoundedRectangleBorder
```

### Theme Access (via context extensions from `core/utils`)

```dart
context.textTheme.titleSmall?.semiBold   // TextStyle extension
context.colorScheme.primary
context.semanticColors.success           // AppSemanticColors extension
context.isDarkMode
context.isMobile / context.isTablet / context.isDesktop
```

### Text Style Extensions

```dart
style.bold, .semiBold, .light, .italic, .withColor(color)
```

---

## Responsive Layout

Breakpoints (via `context_extensions.dart`):

| Getter              | Width    |
| ------------------- | -------- |
| `context.isMobile`  | < 600    |
| `context.isTablet`  | 600–1199 |
| `context.isDesktop` | ≥ 1200   |

Also available via `sizer`: `Device.screenType == ScreenType.tablet`

Pattern for adaptive layouts:

```dart
final isTablet = context.isTablet;
if (isTablet) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, ...),
    ...
  );
}
return ListView.builder(...);
```

---

## Extension Methods

Prefer extensions over utility functions.

| Extension             | File                         | Example                                           |
| --------------------- | ---------------------------- | ------------------------------------------------- |
| `ContextExtensions`   | `context_extensions.dart`    | `context.push(page)`, `context.showSnackBar(msg)` |
| `TextStyleExtensions` | `text_style_extensions.dart` | `style.semiBold`                                  |
| `StringExtensions`    | `string_extensions.dart`     | `"hello".capitalize()`                            |
| `ListExtensions`      | `list_extensions.dart`       | `list.distinctBy((e) => e.id)`                    |
| `NumExtensions`       | `num_extensions.dart`        | `5.seconds`, `3.5.toCurrency()`                   |

---

## Type-Safe Assets

Generated by `flutter_gen_runner` into `lib/gen/assets.gen.dart`. Never use string paths.

```dart
// Icons
Assets.icons.solid.cog.image(width: 20, color: color)
Assets.icons.regular.angleRight.image(width: 16)

// Images
Assets.images.placeholder.image(fit: BoxFit.cover)
```

---

## Dependency Injection

- `GetIt` + `injectable`. Register with `@injectable`, `@lazySingleton`, or `@factory`.
- Setup is called once in `main.dart` via `configureDependencies()`.
- Generated output: `lib/core/configs/di/injection.config.dart` — do not edit.
- BLoCs are currently instantiated manually in pages; repositories and services should be registered via DI.

---

## Naming Conventions

| Kind                | Convention                       | Example                 |
| ------------------- | -------------------------------- | ----------------------- |
| Files               | `snake_case.dart`                | `manage_file_bloc.dart` |
| Classes             | `PascalCase`                     | `ManageFileBloc`        |
| BLoC                | `<Feature>Bloc/Event/State`      | `ManageFileBloc`        |
| Pages               | `<Feature>Page`                  | `HomePage`              |
| Private page widget | `_<Name>View`                    | `_HomePageView`         |
| Helpers             | `<Domain>Helper`                 | `FileHelper`            |
| Extensions          | `<Type>Extensions`               | `ContextExtensions`     |
| Enums               | `PascalCase`, values `camelCase` | `MelType.melmod`        |

---

## Key Patterns & Pitfalls

- **Never put business logic in widgets.** All logic belongs in BLoC event handlers.
- **Freezed part files must exist.** After creating a new `@freezed` class, run `build_runner build` immediately.
- **`lib/gen/assets.gen.dart` is generated.** Do not edit it. Add assets in `pubspec.yaml` and re-run `build_runner`.
- **Isolates require serializable messages.** When using `FileProcessingIsolate`, only pass plain/serializable data between isolates.
- **BLoC should be closed properly.** Override `close()` when the BLoC holds resources (e.g., an isolate).
- **`AppSpacing.pagePadding` is adaptive** — prefer it for outer screen padding instead of hard-coded values.
- **`design_system` exports `sizer` and `device_preview`** — no need to import them separately.
- **`context.isTablet`** is defined in `lib/core/utils/extensions/context_extensions.dart`. Import `core/core.dart` when home_page or feature pages need it (not exported through `design_system`).
