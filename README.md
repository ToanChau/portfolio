# Portfolio App

My personal portfolio website built with Flutter.

## Tech Stack

- **Flutter** 3.11+
- **Dart** 3.0+
- Clean Architecture
- Material Design 3

## Features

- 📱 Responsive design (Mobile, Tablet, Desktop)
- 🎯 Smooth scroll navigation
- 💫 Beautiful animations
- 🎨 Modern UI components

## Getting Started

### Prerequisites

- Flutter SDK (>=3.11.0)
- Dart SDK (>=3.0.0)

### Installation

1. Clone the repository
```bash
git clone https://github.com/ToanChau/Portfolio
cd portfolio
```

2. Install dependencies
```bash
flutter pub get
```

3. Generate code
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. Run the app
```bash
flutter run
```

Or run on web:
```bash
flutter run -d chrome
```

## Project Structure

```
lib/
├── widgets/        # UI components
├── main.dart       # App entry
└── Home.dart       # Home page
shared/             # Utilities & themes
resource/           # Assets
domain/             # Business logic
assets/             # Images, fonts, icons
```

## Build Commands

```bash
# Web
flutter build web --release
```

## Author

**Châu Đức Toàn**



Made with Flutter ❤️

