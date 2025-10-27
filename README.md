# Outfit Hub - Phase 1

## Professional Login, Signup, and Admin Dashboard

### Project Overview
Outfit Hub is a sustainable fashion marketplace mobile application built with Flutter. Phase 1 includes:
- ✅ Professional Login Screen
- ✅ User Registration (Signup) Screen
- ✅ Admin Dashboard
- ✅ User Home Screen
- ✅ Splash Screen with smooth animations
- ✅ State Management with Provider
- ✅ Custom reusable widgets
- ✅ Professional UI/UX with Material Design 3

---

## Features Implemented

### 1. Authentication System
- **Login Screen**
  - Email and password validation
  - Password visibility toggle
  - Demo credentials display
  - Loading states
  - Error handling
  
- **Signup Screen**
  - Complete user registration form
  - Form validation
  - Password confirmation
  - Phone and location fields
  - Responsive design

### 2. User Roles
- **Regular User**: Access to home screen and marketplace features (coming in Phase 2)
- **Admin User**: Access to admin dashboard with platform statistics and management tools

### 3. UI Components
- Custom button widget with loading states
- Custom text field with validation
- Stat cards for displaying metrics
- Professional color scheme and typography
- Smooth animations and transitions

---

## Project Structure

```
outfit_hub/
├── lib/
│   ├── config/
│   │   ├── routes/
│   │   │   └── app_router.dart          # App navigation routing
│   │   └── theme/
│   │       └── app_theme.dart           # App theme and colors
│   ├── models/
│   │   └── user_model.dart              # User data model
│   ├── providers/
│   │   └── auth_provider.dart           # Authentication state management
│   ├── screens/
│   │   ├── admin/
│   │   │   └── admin_dashboard_screen.dart  # Admin dashboard
│   │   ├── auth/
│   │   │   ├── login_screen.dart        # Login screen
│   │   │   └── signup_screen.dart       # Signup screen
│   │   ├── home/
│   │   │   └── home_screen.dart         # User home screen
│   │   └── splash/
│   │       └── splash_screen.dart       # Splash screen
│   ├── services/
│   │   └── auth_service.dart            # Authentication service (mock data)
│   ├── widgets/
│   │   ├── custom_button.dart           # Reusable button widget
│   │   ├── custom_text_field.dart       # Reusable text field widget
│   │   └── stat_card.dart               # Statistics card widget
│   └── main.dart                        # App entry point
├── pubspec.yaml                         # Dependencies
└── README.md                            # This file
```

---

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android device or emulator

### Installation Steps

1. **Navigate to project directory**
   ```bash
   cd /Users/pervaizahmed/Desktop/Eshu/outfit_hub
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## Demo Credentials

### Admin Account
- **Email**: `admin@outfithub.com`
- **Password**: `admin123`
- **Access**: Admin Dashboard with platform statistics

### Regular User Account
- **Email**: `user@outfithub.com`
- **Password**: `user123`
- **Access**: User Home Screen

### Create New Account
You can also create a new account using the Signup screen with any valid information.

---

## Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  google_fonts: ^6.1.0          # Custom fonts
  provider: ^6.1.1              # State management
  go_router: ^12.1.3            # Navigation
  form_field_validator: ^1.1.0  # Form validation
  shared_preferences: ^2.2.2    # Local storage
  http: ^1.1.2                  # HTTP requests
  dio: ^5.4.0                   # Advanced HTTP client
  flutter_secure_storage: ^9.0.0 # Secure storage
  font_awesome_flutter: ^10.6.0  # Icons
  image_picker: ^1.0.7          # Image selection
  fluttertoast: ^8.2.4          # Toast messages
  flutter_spinkit: ^5.2.0       # Loading indicators
```

---

## Screenshots Description

### 1. Splash Screen
- Animated logo with fade-in effect
- App branding
- Automatic navigation based on user authentication status

### 2. Login Screen
- Clean and modern design
- Email and password fields
- Password visibility toggle
- Demo credentials display for testing
- Navigation to Signup screen
- Loading indicator during authentication

### 3. Signup Screen
- Comprehensive registration form
- Fields: Name, Email, Phone, City, Password, Confirm Password
- Real-time validation
- Password strength indicator
- Responsive design

### 4. Admin Dashboard
- Welcome card with gradient background
- Platform statistics cards:
  - Total Users
  - Total Products
  - Total Orders
  - Revenue
- Quick action cards:
  - Manage Users
  - Manage Products
  - Reported Content
  - Analytics
- Logout functionality

### 5. User Home Screen
- Personalized welcome message
- User statistics (Listings, Rating)
- Category browsing (Women, Men, Kids, Accessories)
- Quick actions:
  - Sell an Item
  - My Orders
  - My Listings
- Notification icon
- Logout functionality

---

## Key Features

### State Management
- **Provider Pattern**: Centralized authentication state
- Reactive UI updates
- Efficient re-rendering

### Navigation
- **GoRouter**: Declarative routing
- Deep linking support
- Route guards for authentication

### Data Persistence
- **SharedPreferences**: User session management
- Automatic login on app restart
- Secure token storage

### Mock Authentication
- Simulated API calls with delays
- Pre-configured demo accounts
- Local data storage (no backend required for Phase 1)

---

## Color Palette

```dart
Primary Color:    #6B4CE6 (Purple)
Secondary Color:  #FF6B9D (Pink)
Accent Color:     #FFC145 (Yellow)
Admin Color:      #3498DB (Blue)
Success Color:    #2ECC71 (Green)
Error Color:      #E74C3C (Red)
Background:       #F8F9FA (Light Gray)
Surface:          #FFFFFF (White)
```

---

## Next Phase (Phase 2)

### Planned Features
- Product listing and management
- Category-based browsing
- Search and filter functionality
- Shopping cart
- Product detail views
- Image upload
- User profile management
- Backend API integration
- Real authentication system

---

## Testing

### Manual Testing Checklist
- [x] Splash screen displays correctly
- [x] Login with admin credentials
- [x] Login with user credentials
- [x] Invalid login shows error
- [x] Signup with new account
- [x] Form validation works
- [x] Password visibility toggle
- [x] Navigation between screens
- [x] Admin dashboard displays
- [x] User home screen displays
- [x] Logout functionality
- [x] Session persistence

---

## Troubleshooting

### Common Issues

1. **Packages not found**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Build errors**
   ```bash
   flutter doctor
   flutter upgrade
   ```

3. **App not running**
   - Check if emulator/device is connected
   - Verify Flutter installation
   - Check for Android Studio updates

---

## Development Team

- **Sanjna** (2212268) - Frontend Developer
- **Eshwar Lal** (2212337) - Backend Developer

**Supervisor**: Sadia Aziz  
**Institution**: SZABIST Karachi

---

## License

This project is developed as part of Final Year Project (FYP) at SZABIST.

---

## Contact & Support

For any queries or issues, please contact the development team through the university portal.

---

**Version**: 1.0.0 (Phase 1)  
**Last Updated**: October 25, 2025
