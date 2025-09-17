# Flutter Application Bloc

A Flutter application built with BLoC architecture pattern, featuring development and production environments with automatic token refresh mechanism.

## 📋 Table of Contents

- [Flutter Version](#flutter-version)
- [Project Structure](#project-structure)
- [Environment Setup](#environment-setup)
- [Running the Application](#running-the-application)
- [Flavors Configuration](#flavors-configuration)
- [Authentication & Token Management](#authentication--token-management)
- [Development Guidelines](#development-guidelines)

## Flutter Version

- **Flutter SDK**: 3.29.3 (stable channel)
- **Dart SDK**: ^3.7.2
- **FVM**: Used for Flutter version management

## Project Structure

```ini
lib/
├── main.dart                 # Default entry point
├── main_dev.dart            # Development environment entry point
├── main_prod.dart           # Production environment entry point
├── src/
│   ├── core/
│   │   ├── config/          # Configuration files
│   │   ├── services/        # Core services (Dio, Storage, etc.)
│   │   └── utils/           # Utilities and interceptors
│   ├── data/                # Data layer (repositories, data sources)
│   ├── domain/              # Domain layer (entities, use cases)
│   └── presentation/        # Presentation layer (views, view models)
```

## Environment Setup

### Prerequisites

- Flutter SDK 3.29.3
- Dart SDK ^3.7.2
- FVM (Flutter Version Management)
- Xcode (for iOS development)
- Android Studio (for Android development)

### Installation

1. **Clone the repository**

```bash
git clone <repository-url>
cd flutter_application_bloc
```

2. **Install dependencies**

```bash
fvm flutter pub get
```

3. **Generate code (if needed)**

```bash
fvm flutter packages pub run build_runner build
```

## Running the Application

### Using VS Code Launch Configurations

The project includes pre-configured launch configurations in `.vscode/launch.json`:

#### Development Mode

- **Flutter (DEV Debug)**: Runs development environment in debug mode
- **Flutter (DEV Release)**: Runs development environment in release mode

#### Production Mode

- **Flutter (PROD Debug)**: Runs production environment in debug mode
- **Flutter (PROD Release)**: Runs production environment in release mode

### Using Command Line

#### Development Environment

```bash
# Debug mode
fvm flutter run --flavor dev -t lib/main_dev.dart

# Release mode
fvm flutter run --flavor dev -t lib/main_dev.dart --release
```

#### Production Environment

```bash
# Debug mode
fvm flutter run --flavor prod -t lib/main_prod.dart

# Release mode
fvm flutter run --flavor prod -t lib/main_prod.dart --release
```

### Building for Distribution

#### Android

```bash
# Development APK
fvm flutter build apk --flavor dev -t lib/main_dev.dart

# Production APK
fvm flutter build apk --flavor prod -t lib/main_prod.dart
```

#### iOS

```bash
# Development IPA
fvm flutter build ios --flavor dev -t lib/main_dev.dart

# Production IPA
fvm flutter build ios --flavor prod -t lib/main_prod.dart
```

## Flavors Configuration

### Android Flavors

The Android project is configured with two product flavors in `android/app/build.gradle.kts`:

```kotlin
productFlavors {
    create("dev") {
        dimension = "env"
        applicationIdSuffix = ".dev"
        versionNameSuffix = "-dev"
        resValue("string", "app_name", "flutter_application_bloc Dev")
    }
    create("prod") {
        dimension = "env"
        resValue("string", "app_name", "flutter_application_bloc")
    }
}
```

**Features:**

- **Dev flavor**: App ID suffix `.dev`, version suffix `-dev`, distinct app name
- **Prod flavor**: Standard app ID and name
- **NDK Version**: 27.0.12077973

### iOS Flavors

For iOS, you need to manually configure schemes in Xcode:

1. **Open Xcode workspace**

```bash
open ios/Runner.xcworkspace
```

2. **Create schemes**:

   - Duplicate the `Runner` scheme twice
   - Name them: `Runner-dev` and `Runner-prod`
   - Configure build settings for each scheme

3. **Configure bundle identifiers**:

   - Dev: `com.example.flutterApplicationBloc.dev`
   - Prod: `com.example.flutterApplicationBloc`

4. **Set display names** in `Info.plist` per configuration

## Authentication & Token Management

### Refresh Token Implementation

The application implements an automatic token refresh mechanism in `lib/src/core/utils/interceptors/data_interceptor.dart`:

## Development Guidelines

### Code Generation

Run code generation when making changes to:

- Freezed classes
- JSON serialization
- Localization files

```bash
fvm flutter packages pub run build_runner build --delete-conflicting-outputs
```

### Localization

The project supports multiple languages:

- **ARB Directory**: `lib/src/core/config/l10n`
- **Generated Directory**: `lib/src/core/config/l10n/generated`
- **Untranslated File**: `untranslated.json`

### Asset Management

- **Images**: `assets/images/`
- **Icons**: `assets/icons/`
- **Fonts**: `assets/fonts/` (Cairo font family)
- **Sounds**: `assets/sounds/`

### Dependencies

Key dependencies include:

- __BLoC__: `flutter_bloc: ^8.1.6`
- **State Management**: `bloc: ^8.1.4`
- **HTTP Client**: `dio: ^5.5.0`
- **Audio**: `audioplayers: ^5.2.1`
- __Storage__: `shared_preferences: ^2.2.3`
- __Dependency Injection__: `get_it: ^7.7.0`

## Troubleshooting

### Common Issues

1. **Flavor Error on iOS**: Ensure Xcode schemes are properly configured
2. **Token Refresh Fails**: Check network connectivity and refresh token validity
3. **Build Errors**: Run `fvm flutter clean` and `fvm flutter pub get`

### Debug Mode

Enable debug logging by setting `kEnableLogging` in your environment configuration.

## Contributing

1. Follow the existing code structure and patterns
2. Ensure all new features include proper error handling
3. Test both development and production environments
4. Update documentation for any new configurations

---

**Note**: This project uses FVM for Flutter version management. Ensure you have FVM installed and configured before running the application.