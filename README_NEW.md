# 🎨 Portfolio App

> A beautiful and responsive Flutter portfolio application showcasing mobile development skills with smooth animations, interactive UI, and modern architecture.

[![Flutter](https://img.shields.io/badge/Flutter-3.11+-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.0+-00A8E1?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green)](LICENSE)

## ✨ Features

- 📱 **Responsive Design** - Works perfectly on mobile, tablet, and desktop
- 🎯 **Smooth Navigation** - Scroll to sections with smooth animations
- 🖱️ **Interactive Menu** - Auto-highlight menu based on scroll position or hover
- 💫 **Beautiful Animations** - Gradient text effects, floating cards, scale transitions
- 🏗️ **Clean Architecture** - Well-organized code structure with BLoC pattern
- 📊 **IntersectionObserver** - Intelligent section detection based on viewport visibility
- 🎭 **Modern UI Components** - Custom buttons, badges, cards with glass morphism effect

## 🎯 Key Sections

| Section | Description |
|---------|-------------|
| **Home/About** | Personal introduction with animated text and achievements |
| **About Details** | Detailed skills showcase with floating tech cards |
| **Skills** | Technical skills and expertise |
| **Projects** | Portfolio of completed projects |
| **Education** | Educational background |
| **Experience** | Work experience and timeline |
| **Contact** | Get in touch section |

## 🛠️ Tech Stack

- **Frontend**: Flutter 3.11+
- **Language**: Dart 3.0+
- **Architecture**: Clean Architecture + BLoC Pattern
- **State Management**: BLoC/Cubit
- **UI Framework**: Material Design 3
- **Assets Generation**: Flutter Gen
- **Localization**: Intl Utils

## 📦 Project Structure

```
portfolio/
├── lib/
│   ├── widgets/
│   │   ├── about_section/       # About section components
│   │   ├── about_detail/        # About detail page
│   │   ├── main_header.dart     # Top navigation header
│   │   ├── menu_drawer.dart     # Mobile drawer menu
│   │   ├── animated_background.dart
│   │   └── logo.dart
│   ├── main.dart                # App entry point
│   ├── Home.dart                # Home page with scroll management
│   └── gen/                      # Generated files (assets, fonts)
├── shared/                       # Shared utilities, extensions, themes
├── resource/                     # Assets and resources
├── domain/                       # Business logic
├── assets/
│   ├── svg/                      # SVG icons and graphics
│   ├── png/                      # PNG images
│   ├── gif/                      # GIF animations
│   ├── lottie/                   # Lottie animations
│   ├── font/                     # Custom fonts
│   └── env/                      # Environment files
├── pubspec.yaml                  # Dependencies
└── README.md                     # This file
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=3.11.0)
- Dart SDK (>=3.0.0)
- Git

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/portfolio.git
cd portfolio
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Generate code via build_runner**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

4. **Generate localization files**
```bash
flutter pub run intl_utils:generate
```

5. **Run the app**
```bash
flutter run
```

For web:
```bash
flutter run -d chrome
```

## 🎨 Key Features Explained

### 1. **Smooth Section Navigation**
- Click menu items → Auto scroll to section
- Click "View Project" → Jump to projects section
- Click "Get in Touch" → Jump to contact section

### 2. **Smart Menu Highlighting**
- Automatically detects which section is currently visible
- Updates menu based on IntersectionObserver logic
- Calculates visible height fraction of each section
- Smooth transitions between menu items

### 3. **Beautiful Animations**
- Text gradient animations with `TextMaskVideo`
- Scale transitions on menu hover (1.0 → 1.12)
- Floating card animations in about section
- Smooth scroll animations (600ms easeInOutCubic)

### 4. **Responsive Design**
- Mobile: Single column layout with stacked sections
- Tablet: Optimized spacing and sizing
- Desktop: Multi-column layouts with full-width content

## 📝 Customization Guide

### Update Personal Information

Edit `lib/widgets/about_section/about_content.dart`:
```dart
// Change your name
"Châu Đức Toàn".typo({...})

// Change bio
"Fresher Mobile Developer specializing in Flutter..."

// Update achievements
final List<AchievementData> aboutAchievements = [
  const AchievementData("8+", "Projects"),
  const AchievementData("3", "Teams Led"),
  const AchievementData("2nd", "Prize Winner"),
];
```

### Add Your Projects

Edit `lib/widgets/project_section/project_section.dart`:
- Add your project details
- Add project images
- Link to GitHub/demo

### Update Contact Information

Add your contact details to:
- Email
- GitHub profile
- LinkedIn
- Phone number

## 🔧 Available Scripts

```bash
# Generate assets and code
flutter pub run build_runner build --delete-conflicting-outputs

# Generate localization files
flutter pub run intl_utils:generate

# Format code
dart format lib/

# Analyze code
flutter analyze

# Run tests
flutter test

# Build APK (Android)
flutter build apk --release

# Build iOS
flutter build ios --release

# Build Web
flutter build web --release
```

## 📱 Responsive Breakpoints

- **Mobile**: < 600dp width
- **Tablet**: 600dp - 1200dp width
- **Desktop**: > 1200dp width

## 🎯 Navigation Architecture

```
Home (About Section)
  ↓
About Details Section
  ↓
Skills Section
  ↓
Projects Section
  ↓
Education Section
  ↓
Experience Section
  ↓
Contact Section
```

### Scroll Detection Logic

The app uses **IntersectionObserver pattern** to detect visible sections:

1. **On scroll**: Calculate visible height fraction of each section
2. **Find max visible**: Determine which section occupies most viewport
3. **Update header**: Highlight corresponding menu item
4. **Smooth transition**: Animate menu item highlighting

```dart
// Example calculation
double visibleFraction = visibleHeight / screenHeight;
// If section > 50% visible → highlight in menu
```

## 🌐 Deployment

### Deploy to GitHub Pages (Web)
```bash
flutter build web --release
# Push build/web to gh-pages branch
```

### Deploy to Google Play (Android)
```bash
flutter build appbundle --release
# Upload to Google Play Console
```

### Deploy to App Store (iOS)
```bash
flutter build ios --release
# Upload with Xcode or Transporter
```

## 📚 Dependencies

Key packages used:
- `flutter_svg` - SVG rendering
- `shared` - Custom theme and utilities
- `resource` - Assets and localization
- `domain` - Business logic layer
- `build_runner` - Code generation
- `intl_utils` - Localization
- `lottie` - Animation support

See `pubspec.yaml` for full list and versions.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Châu Đức Toàn** - Fresher Mobile Developer

- 📧 Email: your.email@example.com
- 🐙 GitHub: [@yourusername](https://github.com/yourusername)
- 💼 LinkedIn: [Your Profile](https://linkedin.com/in/yourprofile)
- 🌐 Portfolio: [your-website.com](https://your-website.com)

## 🙏 Acknowledgments

- Flutter community for amazing resources and documentation
- Material Design team for design inspiration
- All open-source packages used in this project
- Contributors and supporters

## 📞 Support

If you have any questions or issues:
- Open an [Issue](https://github.com/yourusername/portfolio/issues)
- Send an email
- Check the [Discussions](https://github.com/yourusername/portfolio/discussions)

## 📈 Future Enhancements

- [ ] Add dark mode support
- [ ] Implement contact form with backend
- [ ] Add language switching (EN/VI)
- [ ] Add more project showcases
- [ ] Performance optimization
- [ ] Add analytics
- [ ] Blog section
- [ ] Guest book/comments

---

**Made with ❤️ using Flutter**

*Last Updated: January 2026*

