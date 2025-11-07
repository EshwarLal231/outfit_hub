import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_model.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  // Mock Login - For Phase 1 (No Backend Yet)
  Future<UserModel?> login(String email, String password) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock validation
    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }

    // Check for admin credentials
    if (email == 'admin@outfithub.com' && password == 'admin123') {
      final adminUser = UserModel(
        id: 'admin001',
        name: 'Admin User',
        email: 'admin@outfithub.com',
        phone: '+92-300-1234567',
        location: 'Karachi',
        role: 'admin',
        rating: 5.0,
        totalTransactions: 0,
        isActive: true,
        isVerified: true,
        createdAt: DateTime.now(),
      );
      
      await _saveUserData(adminUser);
      return adminUser;
    }

    // Check for buyer user credentials
    if (email == 'buyer@outfithub.com' && password == 'buyer123') {
      final buyerUser = UserModel(
        id: 'user001',
        name: 'John Doe',
        email: 'buyer@outfithub.com',
        phone: '+92-300-9876543',
        location: 'Karachi',
        role: 'buyer',
        rating: 4.5,
        totalTransactions: 10,
        isActive: true,
        isVerified: true,
        createdAt: DateTime.now(),
      );
      
      await _saveUserData(buyerUser);
      return buyerUser;
    }

    // Check for seller user credentials
    if (email == 'seller@outfithub.com' && password == 'seller123') {
      final sellerUser = UserModel(
        id: 'seller001',
        name: 'Jane Smith',
        email: 'seller@outfithub.com',
        phone: '+92-300-1111111',
        location: 'Lahore',
        role: 'seller',
        rating: 4.8,
        totalTransactions: 25,
        isActive: true,
        isVerified: true,
        createdAt: DateTime.now(),
      );
      
      await _saveUserData(sellerUser);
      return sellerUser;
    }

    // Check for user with both roles
    if (email == 'both@outfithub.com' && password == 'both123') {
      final bothUser = UserModel(
        id: 'both001',
        name: 'Alex Johnson',
        email: 'both@outfithub.com',
        phone: '+92-300-2222222',
        location: 'Islamabad',
        role: 'both',
        rating: 4.7,
        totalTransactions: 15,
        isActive: true,
        isVerified: true,
        createdAt: DateTime.now(),
      );
      
      await _saveUserData(bothUser);
      return bothUser;
    }

    // Invalid credentials
    throw Exception('Invalid email or password');
  }

  // Mock Signup - For Phase 1
  Future<UserModel?> signup({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String location,
    String role = 'buyer',
  }) async {
    // Simulate API call delay
    await Future.delayed(const Duration(seconds: 2));

    // Mock validation
    if (name.isEmpty || email.isEmpty || password.isEmpty || 
        phone.isEmpty || location.isEmpty) {
      throw Exception('All fields are required');
    }

    if (!email.contains('@')) {
      throw Exception('Invalid email format');
    }

    if (password.length < 8) {
      throw Exception('Password must be at least 8 characters');
    }

    // Create new user
    final newUser = UserModel(
      id: 'user_${DateTime.now().millisecondsSinceEpoch}',
      name: name,
      email: email,
      phone: phone,
      location: location,
      role: role,
      rating: 0.0,
      totalTransactions: 0,
      isActive: true,
      isVerified: false,
      createdAt: DateTime.now(),
    );

    await _saveUserData(newUser);
    return newUser;
  }

  // Save user data to local storage
  Future<void> _saveUserData(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, jsonEncode(user.toJson()));
    await prefs.setString(_tokenKey, 'mock_token_${user.id}');
  }

  // Get saved user data
  Future<UserModel?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_userKey);
    
    if (userData != null) {
      return UserModel.fromJson(jsonDecode(userData));
    }
    return null;
  }

  // Logout
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
    await prefs.remove(_tokenKey);
  }

  // Check if user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenKey);
  }
}
