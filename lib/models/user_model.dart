class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String location;
  final String role; // 'buyer', 'seller', 'admin'
  final String? profilePicture;
  final double rating;
  final int totalTransactions;
  final bool isActive;
  final bool isVerified;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    this.role = 'buyer',
    this.profilePicture,
    this.rating = 0.0,
    this.totalTransactions = 0,
    this.isActive = true,
    this.isVerified = false,
    required this.createdAt,
  });

  // From JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      location: json['location'] ?? '',
      role: json['role'] ?? 'buyer',
      profilePicture: json['profilePicture'],
      rating: (json['rating'] ?? 0).toDouble(),
      totalTransactions: json['totalTransactions'] ?? 0,
      isActive: json['isActive'] ?? true,
      isVerified: json['isVerified'] ?? false,
      createdAt: json['createdAt'] != null 
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'location': location,
      'role': role,
      'profilePicture': profilePicture,
      'rating': rating,
      'totalTransactions': totalTransactions,
      'isActive': isActive,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Copy with
  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? location,
    String? role,
    String? profilePicture,
    double? rating,
    int? totalTransactions,
    bool? isActive,
    bool? isVerified,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      role: role ?? this.role,
      profilePicture: profilePicture ?? this.profilePicture,
      rating: rating ?? this.rating,
      totalTransactions: totalTransactions ?? this.totalTransactions,
      isActive: isActive ?? this.isActive,
      isVerified: isVerified ?? this.isVerified,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
