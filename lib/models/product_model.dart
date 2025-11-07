class ProductModel {
  final String id;
  final String sellerId;
  final String sellerName;
  final String title;
  final String description;
  final double price;
  final String category; // 'men', 'women', 'kids', 'accessories'
  final String condition; // 'new', 'like-new', 'good', 'fair'
  final String size; // 'XS', 'S', 'M', 'L', 'XL', 'XXL', etc.
  final String brand;
  final List<String> images;
  final List<String> colors;
  final String location;
  final bool isAvailable;
  final bool isFeatured;
  final int views;
  final int likes;
  final DateTime createdAt;
  final DateTime? soldAt;
  final Map<String, dynamic>? metadata; // For additional info

  ProductModel({
    required this.id,
    required this.sellerId,
    required this.sellerName,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    this.condition = 'good',
    this.size = 'M',
    this.brand = '',
    this.images = const [],
    this.colors = const [],
    required this.location,
    this.isAvailable = true,
    this.isFeatured = false,
    this.views = 0,
    this.likes = 0,
    required this.createdAt,
    this.soldAt,
    this.metadata,
  });

  // From JSON
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id'] ?? json['id'] ?? '',
      sellerId: json['sellerId'] ?? '',
      sellerName: json['sellerName'] ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      category: json['category'] ?? '',
      condition: json['condition'] ?? 'good',
      size: json['size'] ?? 'M',
      brand: json['brand'] ?? '',
      images: json['images'] != null 
          ? List<String>.from(json['images'])
          : [],
      colors: json['colors'] != null
          ? List<String>.from(json['colors'])
          : [],
      location: json['location'] ?? '',
      isAvailable: json['isAvailable'] ?? true,
      isFeatured: json['isFeatured'] ?? false,
      views: json['views'] ?? 0,
      likes: json['likes'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
      soldAt: json['soldAt'] != null
          ? DateTime.parse(json['soldAt'])
          : null,
      metadata: json['metadata'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'title': title,
      'description': description,
      'price': price,
      'category': category,
      'condition': condition,
      'size': size,
      'brand': brand,
      'images': images,
      'colors': colors,
      'location': location,
      'isAvailable': isAvailable,
      'isFeatured': isFeatured,
      'views': views,
      'likes': likes,
      'createdAt': createdAt.toIso8601String(),
      'soldAt': soldAt?.toIso8601String(),
      'metadata': metadata,
    };
  }

  // Copy with
  ProductModel copyWith({
    String? id,
    String? sellerId,
    String? sellerName,
    String? title,
    String? description,
    double? price,
    String? category,
    String? condition,
    String? size,
    String? brand,
    List<String>? images,
    List<String>? colors,
    String? location,
    bool? isAvailable,
    bool? isFeatured,
    int? views,
    int? likes,
    DateTime? createdAt,
    DateTime? soldAt,
    Map<String, dynamic>? metadata,
  }) {
    return ProductModel(
      id: id ?? this.id,
      sellerId: sellerId ?? this.sellerId,
      sellerName: sellerName ?? this.sellerName,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      category: category ?? this.category,
      condition: condition ?? this.condition,
      size: size ?? this.size,
      brand: brand ?? this.brand,
      images: images ?? this.images,
      colors: colors ?? this.colors,
      location: location ?? this.location,
      isAvailable: isAvailable ?? this.isAvailable,
      isFeatured: isFeatured ?? this.isFeatured,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      createdAt: createdAt ?? this.createdAt,
      soldAt: soldAt ?? this.soldAt,
      metadata: metadata ?? this.metadata,
    );
  }

  // Get formatted price
  String get formattedPrice => 'Rs. ${price.toStringAsFixed(0)}';

  // Get condition badge color
  String get conditionBadge {
    switch (condition) {
      case 'new':
        return '✨ Brand New';
      case 'like-new':
        return '⭐ Like New';
      case 'good':
        return '👍 Good';
      case 'fair':
        return '👌 Fair';
      default:
        return condition;
    }
  }
}
