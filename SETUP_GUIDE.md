# 🚀 Outfit Hub - Phase 1 Setup & Run Guide

## Quick Start Guide

### Step 1: Install Flutter Dependencies
Open your terminal and run:

```bash
cd /Users/pervaizahmed/Desktop/Eshu/outfit_hub
flutter pub get
```

### Step 2: Run the Application
```bash
flutter run
```

Or if you're using VS Code:
- Press `F5` or click "Run" → "Start Debugging"

---

## 📱 Testing the Application

### Login Credentials

#### Admin User
```
Email: admin@outfithub.com
Password: admin123
```
✅ This will take you to the **Admin Dashboard** with:
- Platform statistics (Users, Products, Orders, Revenue)
- Quick action cards for management
- Professional admin interface

#### Regular User
```
Email: user@outfithub.com
Password: user123
```
✅ This will take you to the **User Home Screen** with:
- Personalized welcome
- Browse categories (Women, Men, Kids, Accessories)
- Quick actions (Sell Item, Orders, Listings)

#### Create New Account
Click "Sign Up" and fill in the registration form with any details!

---

## 📂 Project Structure Overview

```
outfit_hub/
├── lib/
│   ├── main.dart                        # App entry point
│   ├── config/
│   │   ├── routes/app_router.dart       # Navigation setup
│   │   └── theme/app_theme.dart         # Colors & styling
│   ├── models/
│   │   └── user_model.dart              # User data structure
│   ├── providers/
│   │   └── auth_provider.dart           # State management
│   ├── services/
│   │   └── auth_service.dart            # Authentication logic
│   ├── screens/
│   │   ├── splash/splash_screen.dart    # App launch screen
│   │   ├── auth/
│   │   │   ├── login_screen.dart        # Login page
│   │   │   └── signup_screen.dart       # Registration page
│   │   ├── admin/
│   │   │   └── admin_dashboard_screen.dart  # Admin panel
│   │   └── home/
│   │       └── home_screen.dart         # User home
│   └── widgets/
│       ├── custom_button.dart           # Reusable button
│       ├── custom_text_field.dart       # Reusable input field
│       └── stat_card.dart               # Statistics card
└── pubspec.yaml                         # Dependencies
```

---

## 🎨 Key Features Implemented

### ✨ Authentication System
- [x] Professional login screen with validation
- [x] User registration with complete form
- [x] Password visibility toggle
- [x] Form validation (email, password strength)
- [x] Loading states during authentication
- [x] Error handling with toast messages
- [x] Session persistence (stays logged in)

### 👤 User Management
- [x] Two user roles: Admin & Regular User
- [x] Role-based navigation
- [x] User profile data storage
- [x] Automatic login on app restart

### 🎯 Admin Dashboard
- [x] Platform statistics cards
- [x] Quick action menu
- [x] Professional gradient design
- [x] Management tools placeholder

### 🏠 User Home Screen
- [x] Personalized welcome message
- [x] User statistics display
- [x] Category browsing cards
- [x] Quick actions menu
- [x] Modern UI with gradients

### 🎭 UI/UX Excellence
- [x] Material Design 3
- [x] Custom Google Fonts (Poppins, Inter)
- [x] Smooth animations
- [x] Responsive design
- [x] Professional color palette
- [x] Custom reusable widgets

---

## 🔧 Technologies Used

| Technology | Purpose |
|------------|---------|
| **Flutter** | Cross-platform mobile framework |
| **Dart** | Programming language |
| **Provider** | State management |
| **GoRouter** | Navigation & routing |
| **SharedPreferences** | Local data storage |
| **Google Fonts** | Custom typography |
| **Fluttertoast** | Toast notifications |

---

## 🎨 Design System

### Color Palette
```dart
Primary:    #6B4CE6  (Purple)   - Main brand color
Secondary:  #FF6B9D  (Pink)     - Accent elements
Accent:     #FFC145  (Yellow)   - Highlights
Admin:      #3498DB  (Blue)     - Admin interface
Success:    #2ECC71  (Green)    - Success states
Error:      #E74C3C  (Red)      - Error states
```

### Typography
- **Headings**: Poppins (Bold, Semi-bold)
- **Body Text**: Inter (Regular, Medium)
- **Sizes**: 12sp - 32sp (responsive)

---

## 📱 Screen Flow

```
Splash Screen
    ↓
Login Screen ←→ Signup Screen
    ↓
[Authentication Check]
    ↓
├─→ Admin? → Admin Dashboard
└─→ User?  → User Home Screen
```

---

## 🧪 Testing Checklist

### Authentication
- [x] Login with admin account
- [x] Login with user account  
- [x] Login with invalid credentials (shows error)
- [x] Signup with new account
- [x] Form validation works correctly
- [x] Password toggle visibility
- [x] Logout functionality

### Navigation
- [x] Splash screen auto-navigates
- [x] Admin redirected to dashboard
- [x] User redirected to home
- [x] Login/Signup navigation
- [x] Back button handling

### UI/UX
- [x] Smooth animations
- [x] Loading indicators appear
- [x] Toast messages display
- [x] Responsive layout
- [x] Professional appearance

---

## 🐛 Troubleshooting

### Problem: "Package not found" errors
**Solution:**
```bash
flutter clean
flutter pub get
```

### Problem: App won't build
**Solution:**
```bash
flutter doctor
# Fix any issues shown
flutter upgrade
```

### Problem: Hot reload not working
**Solution:**
- Stop the app
- Run `flutter clean`
- Run `flutter run` again

### Problem: Emulator not detected
**Solution:**
1. Open Android Studio
2. Go to AVD Manager
3. Start an emulator
4. Run `flutter devices` to verify

---

## 📝 Development Notes

### Current Implementation (Phase 1)
- Mock authentication (no real backend)
- Local data storage using SharedPreferences
- Hardcoded demo credentials
- Static statistics on admin dashboard
- UI placeholders for future features

### Coming in Phase 2
- Backend API integration
- Product listing module
- Search & filter functionality
- Shopping cart
- Real-time data
- Image upload
- User profile editing
- Order management

---

## 🎓 Academic Information

**Project**: Outfit Hub - Sustainable Fashion Marketplace  
**Phase**: Phase 1 - Authentication & UI  
**Institution**: SZABIST Karachi  
**Supervisor**: Sadia Aziz  

**Development Team**:
- Sanjna (2212268) - Frontend
- Eshwar Lal (2212337) - Backend

---

## 📚 Learning Resources

### Flutter Documentation
- [Flutter Official Docs](https://docs.flutter.dev/)
- [Flutter Widget Catalog](https://docs.flutter.dev/development/ui/widgets)

### State Management
- [Provider Package](https://pub.dev/packages/provider)

### Navigation
- [GoRouter Package](https://pub.dev/packages/go_router)

---

## 🎯 Next Steps

1. **Test the application** with all demo credentials
2. **Explore the code structure** to understand the architecture
3. **Review the SRS document** for Phase 2 requirements
4. **Plan Phase 2 development** (Product listing, etc.)

---

## 💡 Tips for Presentation

### Demo Flow Suggestion
1. Start with splash screen
2. Show login with user credentials → User Home
3. Logout
4. Show login with admin credentials → Admin Dashboard
5. Showcase signup functionality
6. Highlight responsive UI and smooth animations
7. Explain the code architecture

### Key Points to Mention
- ✅ Professional UI/UX design
- ✅ Complete authentication system
- ✅ Role-based access control
- ✅ State management with Provider
- ✅ Reusable custom widgets
- ✅ Material Design 3 compliance
- ✅ Scalable architecture for Phase 2

---

## 📞 Support

If you encounter any issues:
1. Check the troubleshooting section above
2. Run `flutter doctor -v` for detailed diagnostics
3. Review error messages in console
4. Check pubspec.yaml for correct dependencies

---

**Version**: 1.0.0 (Phase 1)  
**Date**: October 25, 2025  
**Status**: ✅ Ready for Demo & Testing

---

## 🎉 You're All Set!

Run these commands to get started:
```bash
cd /Users/pervaizahmed/Desktop/Eshu/outfit_hub
flutter pub get
flutter run
```

**Happy Coding! 🚀**
