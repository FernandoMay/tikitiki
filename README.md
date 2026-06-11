# TikiTiki 🎵

**Short-form video platform** — swipe through vertical videos, like, comment, and share. Built with Flutter & GetX.

Brand identity: **Neon pink** (#FF1493) · Material 3 · Dark theme

## Stack

- **Flutter** — Cross-platform mobile framework
- **GetX** — State management, dependency injection & routing
- **Video Player** — In-app video playback
- **Image Picker** — Camera & gallery capture
- **Timeago** — Relative timestamp formatting

## Quick Start

```bash
flutter pub get
flutter run
```

## Features

- **Vertical Video Feed** — Infinite scroll with PageView
- **GetX Controllers** — Lightweight reactive state management
- **Media Upload** — Record or pick videos from the device
- **Social Actions** — Like, comment, follow users
- **Search & Profiles** — Discover creators and view their content
- **Timeago** — Human-readable relative timestamps

## Architecture

GetX pattern with controller-based separation:

| Layer | Directory | Purpose |
|-------|-----------|---------|
| **Views** | `lib/views/` | UI screens (Home, Video, Profile, etc.) |
| **Controllers** | `lib/controllers/` | GetX controllers for business logic |
| **Models** | `lib/models.dart` | Data classes (Comment, User, Video) |
| **Services** | `lib/services/` | Firebase stubs & external integrations |

## Build

```bash
flutter pub get
flutter run                          # Run on connected device/emulator
flutter build apk --debug            # Debug APK
flutter build apk --release          # Release APK
flutter build ios --no-codesign      # iOS build (unsigned)
```

## CI/CD

GitHub Actions workflow at `.github/workflows/flutter.yml`:
- `flutter analyze` — static analysis
- `flutter test` — unit & widget tests
- `flutter build apk --debug` — debug APK artifact

## Deploy

### Android
1. Bump version in `pubspec.yaml`
2. `flutter build apk --release` or `flutter build appbundle --release`
3. Upload to Google Play Console

### iOS
1. Open `ios/Runner.xcworkspace` in Xcode
2. Archive → Upload to App Store Connect

## Tests

```bash
flutter test
```

## License

MIT
