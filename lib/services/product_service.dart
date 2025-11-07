import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';
import '../models/product_model.dart';

class ProductService {
  final SupabaseClient _supabase = SupabaseConfig.client;

  // Create a new product
  Future<ProductModel?> createProduct(ProductModel product) async {
    try {
      final response = await _supabase
          .from(SupabaseConfig.productsTable)
          .insert(product.toJson())
          .select()
          .single();

      return ProductModel.fromJson(response);
    } catch (e) {
      print('Error creating product: $e');
      throw Exception('Failed to create product: $e');
    }
  }

  // Get all products
  Future<List<ProductModel>> getAllProducts({
    String? category,
    String? sellerId,
    bool? isAvailable,
    int limit = 50,
    int offset = 0,
  }) async {
    try {
      var query = _supabase
          .from(SupabaseConfig.productsTable)
          .select();

      if (category != null && category != 'all') {
        query = query.eq('category', category);
      }

      if (sellerId != null) {
        query = query.eq('seller_id', sellerId);
      }

      if (isAvailable != null) {
        query = query.eq('is_available', isAvailable);
      }

      final response = await query
          .order('created_at', ascending: false)
          .range(offset, offset + limit - 1);

      return (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to fetch products: $e');
    }
  }

  // Get product by ID
  Future<ProductModel?> getProductById(String productId) async {
    try {
      final response = await _supabase
          .from(SupabaseConfig.productsTable)
          .select()
          .eq('id', productId)
          .single();

      // Increment views
      await incrementViews(productId);

      return ProductModel.fromJson(response);
    } catch (e) {
      print('Error fetching product: $e');
      return null;
    }
  }

  // Get products by seller
  Future<List<ProductModel>> getProductsBySeller(String sellerId) async {
    try {
      final response = await _supabase
          .from(SupabaseConfig.productsTable)
          .select()
          .eq('seller_id', sellerId)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching seller products: $e');
      throw Exception('Failed to fetch seller products: $e');
    }
  }

  // Update product
  Future<ProductModel?> updateProduct(
    String productId,
    Map<String, dynamic> updates,
  ) async {
    try {
      final response = await _supabase
          .from(SupabaseConfig.productsTable)
          .update(updates)
          .eq('id', productId)
          .select()
          .single();

      return ProductModel.fromJson(response);
    } catch (e) {
      print('Error updating product: $e');
      throw Exception('Failed to update product: $e');
    }
  }

  // Delete product
  Future<void> deleteProduct(String productId) async {
    try {
      await _supabase
          .from(SupabaseConfig.productsTable)
          .delete()
          .eq('id', productId);
    } catch (e) {
      print('Error deleting product: $e');
      throw Exception('Failed to delete product: $e');
    }
  }

  // Increment product views
  Future<void> incrementViews(String productId) async {
    try {
      await _supabase.rpc('increment_product_views', params: {
        'product_id': productId,
      });
    } catch (e) {
      print('Error incrementing views: $e');
    }
  }

  // Search products
  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final response = await _supabase
          .from(SupabaseConfig.productsTable)
          .select()
          .or('title.ilike.%$query%,description.ilike.%$query%,brand.ilike.%$query%')
          .eq('is_available', true)
          .order('created_at', ascending: false);

      return (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error searching products: $e');
      throw Exception('Failed to search products: $e');
    }
  }

  // Get featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final response = await _supabase
          .from(SupabaseConfig.productsTable)
          .select()
          .eq('is_featured', true)
          .eq('is_available', true)
          .order('created_at', ascending: false)
          .limit(10);

      return (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      print('Error fetching featured products: $e');
      return [];
    }
  }

  // Mark product as sold
  Future<void> markAsSold(String productId) async {
    try {
      await _supabase
          .from(SupabaseConfig.productsTable)
          .update({
            'is_available': false,
            'sold_at': DateTime.now().toIso8601String(),
          })
          .eq('id', productId);
    } catch (e) {
      print('Error marking product as sold: $e');
      throw Exception('Failed to mark product as sold: $e');
    }
  }

  // Get product statistics for seller
  Future<Map<String, dynamic>> getSellerStats(String sellerId) async {
    try {
      final products = await getProductsBySeller(sellerId);
      
      final activeListings = products.where((p) => p.isAvailable).length;
      final soldItems = products.where((p) => !p.isAvailable).length;
      final totalViews = products.fold<int>(0, (sum, p) => sum + p.views);
      final totalLikes = products.fold<int>(0, (sum, p) => sum + p.likes);
      final totalRevenue = products
          .where((p) => !p.isAvailable)
          .fold<double>(0, (sum, p) => sum + p.price);

      return {
        'active_listings': activeListings,
        'sold_items': soldItems,
        'total_views': totalViews,
        'total_likes': totalLikes,
        'total_revenue': totalRevenue,
        'total_products': products.length,
      };
    } catch (e) {
      print('Error fetching seller stats: $e');
      return {
        'active_listings': 0,
        'sold_items': 0,
        'total_views': 0,
        'total_likes': 0,
        'total_revenue': 0.0,
        'total_products': 0,
      };
    }
  }
}
