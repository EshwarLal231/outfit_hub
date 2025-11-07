# Clone and Setup Instructions

Follow these steps to clone and run the Outfit Hub project on a new computer.

## Prerequisites

Before you begin, make sure you have the following installed:

1. **Git** (Install this FIRST!)
   - **Windows**: Download from https://git-scm.com/download/win
     - Run the installer and use default settings
     - After installation, restart your terminal/PowerShell
   - **macOS**: Install via Homebrew: `brew install git` or download from https://git-scm.com/download/mac
   - **Linux**: `sudo apt-get install git` (Ubuntu/Debian) or `sudo yum install git` (Fedora)
   - Verify installation: `git --version`
   - **IMPORTANT**: Close and reopen your terminal/PowerShell after installing Git

2. **Flutter SDK** (latest stable version)
   - **Windows**: Download from https://docs.flutter.dev/get-started/install/windows
   - **macOS**: Download from https://docs.flutter.dev/get-started/install/macos
   - **Linux**: Download from https://docs.flutter.dev/get-started/install/linux
   - Follow the installation guide for your platform
   - Add Flutter to your PATH
   - Verify installation: `flutter --version`

3. **IDE/Editor** (Choose one)
   - **Visual Studio Code** (Recommended)
     - Download from: https://code.visualstudio.com/
     - Install Flutter extension
     - Install Dart extension
   - **Android Studio**
     - Download from: https://developer.android.com/studio
     - Install Flutter plugin
     - Install Dart plugin

4. **Platform-specific requirements:**
   - **For iOS development (macOS only):**
     - Xcode (latest version from Mac App Store)
     - CocoaPods: `sudo gem install cocoapods`
   
   - **For Android development (Windows/macOS/Linux):**
     - Android Studio
     - Android SDK (install via Android Studio)
     - Java Development Kit (JDK) - usually comes with Android Studio
     
   - **For Windows development (Windows only):**
     - Visual Studio 2022 with "Desktop development with C++" workload

## 🚀 Quick Installation Guide for Windows

If you're on Windows and starting from scratch:

### Step 1: Install Git
1. Go to https://git-scm.com/download/win
2. Download the 64-bit installer
3. Run the installer with default settings
4. **Close and reopen PowerShell/Command Prompt**
5. Verify: `git --version`

### Step 2: Install Flutter
1. Go to https://docs.flutter.dev/get-started/install/windows
2. Download the Flutter SDK zip file
3. Extract to `C:\src\flutter` (or your preferred location)
4. Add Flutter to PATH:
   - Search "Environment Variables" in Windows
   - Edit "Path" under System variables
   - Add: `C:\src\flutter\bin`
5. **Close and reopen PowerShell**
6. Verify: `flutter --version`
7. Run: `flutter doctor` to check setup

### Step 3: Install Android Studio (for Android development)
1. Download from https://developer.android.com/studio
2. Install Android Studio
3. Open Android Studio → More Actions → SDK Manager
4. Install Android SDK and required tools
5. Run: `flutter doctor --android-licenses` and accept all

### Step 4: Install VS Code (Recommended Editor)
1. Download from https://code.visualstudio.com/
2. Install VS Code
3. Open VS Code
4. Install extensions:
   - Flutter
   - Dart
   - (Optional) GitLens, Prettier

Now you're ready to clone the project!

## Step-by-Step Setup

### 1. Clone the Repository

Open your terminal/PowerShell/Command Prompt and run:

**Windows (PowerShell or Command Prompt):**
```powershell
# Navigate to where you want to store the project
cd "C:\My Project\aaa"  # or any directory of your choice

# Clone the repository
git clone https://github.com/EshwarLal231/outfit_hub.git

# Navigate into the project directory
cd outfit_hub
```

**macOS/Linux (Terminal):**
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

The app comes with demo credentials for testing different user roles:

**Admin Account:**
- Email: admin@outfithub.com
- Password: admin123
- Access: Admin dashboard with full control

**Buyer Account:**
- Email: buyer@outfithub.com
- Password: buyer123
- Access: Browse and purchase products

**Seller Account:**
- Email: seller@outfithub.com
- Password: seller123
- Access: List and manage products for sale

**Buyer + Seller Account:**
- Email: both@outfithub.com
- Password: both123
- Access: Full buyer and seller capabilities

## Troubleshooting

### Common Issues:

1. **"git is not recognized" (Windows)**
   - Git is not installed or not in PATH
   - Install Git from https://git-scm.com/download/win
   - **Important**: Close and reopen PowerShell/Command Prompt after installation
   - If still not working, add Git to PATH manually:
     - Default location: `C:\Program Files\Git\cmd`
     - Add to Environment Variables → System → Path

2. **"flutter is not recognized" (Windows)**
   - Flutter is not installed or not in PATH
   - Extract Flutter SDK to a location (e.g., `C:\src\flutter`)
   - Add `C:\src\flutter\bin` to PATH
   - Close and reopen PowerShell/Command Prompt
   - Run `flutter doctor`

3. **"No devices found"**
   - Make sure an emulator/simulator is running
   - Run `flutter devices` to check
   - For Android: Start emulator from Android Studio
   - For iOS (macOS): Run `open -a Simulator`

4. **"Pub get failed"**
   - Check your internet connection
   - Run `flutter pub cache repair`
   - Try `flutter clean` then `flutter pub get`

5. **iOS pod install fails (macOS only)**
   - Update CocoaPods: `sudo gem install cocoapods`
   - Delete Podfile.lock and Pods folder
   - Run `pod install` again

6. **Android build fails**
   - Accept licenses: `flutter doctor --android-licenses`
   - Update Gradle: Check android/gradle/wrapper/gradle-wrapper.properties

7. **Package version conflicts**
   - Run `flutter clean`
   - Delete `pubspec.lock`
   - Run `flutter pub get`

8. **PowerShell execution policy error (Windows)**
   - Run PowerShell as Administrator
   - Execute: `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`
   - Type 'Y' to confirm

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
