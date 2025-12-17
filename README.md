# Example Flutter App

A Flutter application demonstrating clean architecture with BLoC pattern, dependency injection, and modular structure.

## Features

- 🎯 **BLoC State Management** - Using flutter_bloc for predictable state management
- 💉 **Dependency Injection** - Injectable & GetIt for clean dependency management
- 🏗️ **Feature-First Architecture** - Organized by features for scalability
- 🎨 **Material 3 Design** - Modern UI with light/dark theme support
- ✅ **Form Validation** - Comprehensive validation utilities
- 🧪 **Widget Testing** - Automated testing setup

## Project Structure

```
lib/
├── config/           # App configuration
│   ├── injection.dart       # DI setup
│   ├── injection.config.dart
│   └── theme.dart          # Theme configuration
├── features/         # Feature modules
│   └── counter/
│       ├── bloc/           # Business logic
│       ├── pages/          # UI screens
│       └── widgets/        # Feature-specific widgets
├── util/            # Utilities
│   ├── constants.dart      # App constants
│   ├── extensions.dart     # Dart extensions
│   ├── helpers.dart        # Helper functions
│   └── validators.dart     # Form validators
└── main.dart        # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK (>=3.10.4)
- Dart SDK (>=3.10.4)
- Android Studio / Xcode (for mobile development)

### Installation

1. Clone the repository
```bash
git clone <repository-url>
cd example
```

2. Install dependencies
```bash
flutter pub get
```

3. Generate code (for dependency injection)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app
```bash
flutter run
```

## Architecture

### State Management
This project uses **BLoC (Business Logic Component)** pattern:
- [`CounterBloc`](lib/features/counter/bloc/counter_bloc.dart) - Manages counter state
- Events: `CounterIncrementPressed`, `CounterDecrementPressed`, `CounterResetPressed`
- State: [`CounterState`](lib/features/counter/bloc/counter_state.dart) with immutable count

### Dependency Injection
Uses **Injectable** with **GetIt**:
- Configuration: [lib/config/injection.dart](lib/config/injection.dart)
- Auto-generated: [lib/config/injection.config.dart](lib/config/injection.config.dart)
- Register with `@lazySingleton`, `@injectable`, etc.

### Utilities

#### Validators ([lib/util/validators.dart](lib/util/validators.dart))
```dart
Validators.email(value)           // Email validation
Validators.password(value)        // Strong password rules
Validators.phone(value)           // Phone number validation
Validators.required(value)        // Required field
Validators.compose([...])         // Combine validators
```

#### Extensions ([lib/util/extensions.dart](lib/util/extensions.dart))
```dart
// String
"test@email.com".isValidEmail     // Email check
"Hello".capitalize()              // "Hello"
"Hello world".toTitleCase()       // "Hello World"

// DateTime
DateTime.now().isToday            // Check if today
date.toRelativeTime()             // "2 hours ago"

// BuildContext
context.screenWidth               // Get screen width
context.showSnackBar("Message")   // Show snackbar
context.push(NewPage())           // Navigate
```

#### Helpers ([lib/util/helpers.dart](lib/util/helpers.dart))
```dart
AppHelpers.showSnackBar(context, "Success")
AppHelpers.showLoadingDialog(context)
AppHelpers.showConfirmDialog(context, title: "Confirm?", message: "...")
AppHelpers.formatCurrency(1234.56)  // "$1234.56"
AppHelpers.getInitials("John Doe")  // "JD"
```

## Configuration

### Theme ([lib/config/theme.dart](lib/config/theme.dart))
- Material 3 design system
- Light and dark mode support
- Customizable color scheme based on seed color

### Constants ([lib/util/constants.dart](lib/util/constants.dart))
- `AppConstants` - App name, version
- `AppSizeConstants` - Padding, radius, animations
- `ApiConstants` - API configuration
- `StorageKeys` - Local storage keys
- `RouteNames` - Route definitions

## Testing

Run tests:
```bash
flutter test
```

Widget test example: [test/widget_test.dart](test/widget_test.dart)

## Building

### Android
```bash
flutter build apk --release
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

## Dependencies

### Production
- `flutter_bloc` ^9.1.1 - State management
- `equatable` ^2.0.7 - Value equality
- `get_it` - Service locator
- `injectable` - DI code generation
- `cupertino_icons` ^1.0.8 - iOS icons

### Development
- `build_runner` - Code generation
- `injectable_generator` - DI generator
- `flutter_lints` ^6.0.0 - Linting rules
- `flutter_test` - Testing framework

## Code Generation

When adding new injectable classes:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

Watch mode (auto-regenerate):
```bash
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Library](https://bloclibrary.dev/)
- [Injectable Documentation](https://pub.dev/packages/injectable)
- [Material Design 3](https://m3.material.io/)