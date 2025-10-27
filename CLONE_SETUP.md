# Clone and Setup Instructions

Follow these steps to clone and run the Outfit Hub project on a new computer.

## Prerequisites

Before you begin, make sure you have the following installed:

1. **Flutter SDK** (latest stable version)
   - Download from: https://flutter.dev/docs/get-started/install
   - Verify installation: `flutter --version`

2. **Git**
   - Download from: https://git-scm.com/downloads
   - Verify installation: `git --version`

3. **IDE/Editor** (Choose one)
   - Visual Studio Code with Flutter extension
   - Android Studio with Flutter plugin

4. **Platform-specific requirements:**
   - **For iOS development (macOS only):**
     - Xcode (latest version from Mac App Store)
     - CocoaPods: `sudo gem install cocoapods`
   
   - **For Android development:**
     - Android Studio
     - Android SDK
     - Java Development Kit (JDK)

## Step-by-Step Setup

### 1. Clone the Repository

Open your terminal and run:

```bash
# Navigate to where you want to store the project
cd ~/Development  # or any directory of your choice

# Clone the repository
git clone https://github.com/EshwarLal231/outfit_hub.git

# Navigate into the project directory
cd outfit_hub
```

### 2. Verify Flutter Installation

```bash
# Check Flutter installation
flutter doctor

# This will show you if anything is missing
# Fix any issues shown by flutter doctor before proceeding
```

### 3. Install Dependencies

```bash
# Get all Flutter packages
flutter pub get
```

### 4. Platform-Specific Setup

#### For iOS (macOS only):

```bash
# Navigate to iOS directory
cd ios

# Install CocoaPods dependencies
pod install

# Go back to project root
cd ..
```

#### For Android:

```bash
# Accept Android licenses (if not done already)
flutter doctor --android-licenses

# Press 'y' to accept all licenses
```

### 5. Configure Git (Optional)

If you plan to contribute to the project:

```bash
# Set your git user information
git config user.name "Your Name"
git config user.email "your.email@example.com"
```

### 6. Run the Project

#### Check Available Devices:

```bash
# List all available devices
flutter devices
```

#### Run on Specific Platform:

**For iOS Simulator (macOS only):**
```bash
# Open iOS simulator
open -a Simulator

# Run the app
flutter run
```

**For Android Emulator:**
```bash
# Start an Android emulator from Android Studio, or run:
flutter emulators

# Launch a specific emulator
flutter emulators --launch <emulator_id>

# Run the app
flutter run
```

**For Chrome (Web):**
```bash
flutter run -d chrome
```

**For macOS Desktop:**
```bash
flutter run -d macos
```

### 7. Build the Project (Optional)

#### Build for iOS:
```bash
flutter build ios
```

#### Build for Android:
```bash
flutter build apk  # For APK
flutter build appbundle  # For App Bundle (recommended for Play Store)
```

#### Build for Web:
```bash
flutter build web
```

## Project Structure

```
outfit_hub/
├── lib/
│   ├── config/
│   │   ├── routes/        # App navigation/routing
│   │   └── theme/         # App theme configuration
│   ├── models/            # Data models
│   ├── providers/         # State management (Provider)
│   ├── screens/           # UI screens
│   │   ├── admin/         # Admin dashboard
│   │   ├── auth/          # Login & Signup
│   │   ├── home/          # User home screen
│   │   └── splash/        # Splash screen
│   ├── services/          # API and business logic
│   ├── widgets/           # Reusable widgets
│   └── main.dart          # App entry point
├── test/                  # Unit and widget tests
├── android/               # Android native code
├── ios/                   # iOS native code
└── pubspec.yaml           # Dependencies
```

## Demo Credentials

The app comes with demo credentials for testing:

**Admin Account:**
- Email: admin@outfithub.com
- Password: admin123

**User Account:**
- Email: user@outfithub.com
- Password: user123

## Troubleshooting

### Common Issues:

1. **"No devices found"**
   - Make sure an emulator/simulator is running
   - Run `flutter devices` to check

2. **"Pub get failed"**
   - Check your internet connection
   - Run `flutter pub cache repair`
   - Try `flutter clean` then `flutter pub get`

3. **iOS pod install fails**
   - Update CocoaPods: `sudo gem install cocoapods`
   - Delete Podfile.lock and Pods folder
   - Run `pod install` again

4. **Android build fails**
   - Accept licenses: `flutter doctor --android-licenses`
   - Update Gradle: Check android/gradle/wrapper/gradle-wrapper.properties

5. **Package version conflicts**
   - Run `flutter clean`
   - Delete `pubspec.lock`
   - Run `flutter pub get`

## Development Workflow

### Before Making Changes:
```bash
# Pull latest changes
git pull origin main

# Create a new branch for your feature
git checkout -b feature/your-feature-name
```

### After Making Changes:
```bash
# Check what files changed
git status

# Stage your changes
git add .

# Commit with a meaningful message
git commit -m "Description of your changes"

# Push to GitHub
git push origin feature/your-feature-name
```

### Hot Reload During Development:
- Press `r` in the terminal for hot reload
- Press `R` for hot restart
- Press `q` to quit

## Additional Resources

- **Flutter Documentation:** https://flutter.dev/docs
- **Provider Package:** https://pub.dev/packages/provider
- **GoRouter Package:** https://pub.dev/packages/go_router
- **Google Fonts:** https://pub.dev/packages/google_fonts

## Support

If you encounter any issues:
1. Check the troubleshooting section above
2. Run `flutter doctor -v` for detailed diagnostics
3. Check the project's GitHub Issues page
4. Contact the development team

## Next Steps

1. Explore the codebase
2. Run the app and test all features
3. Check out the existing screens and widgets
4. Review the state management implementation
5. Start contributing!

Happy Coding! 🚀
