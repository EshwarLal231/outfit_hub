import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../config/supabase_config.dart';

class StorageService {
  final SupabaseClient _supabase = SupabaseConfig.client;

  // Upload product image
  Future<String?> uploadProductImage(File imageFile, String productId) async {
    try {
      final fileName = '${productId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final path = 'products/$fileName';

      await _supabase.storage
          .from(SupabaseConfig.productImagesBucket)
          .upload(path, imageFile);

      final imageUrl = _supabase.storage
          .from(SupabaseConfig.productImagesBucket)
          .getPublicUrl(path);

      return imageUrl;
    } catch (e) {
      print('Error uploading product image: $e');
      return null;
    }
  }

  // Upload multiple product images
  Future<List<String>> uploadProductImages(
    List<File> imageFiles,
    String productId,
  ) async {
    final List<String> imageUrls = [];

    for (int i = 0; i < imageFiles.length; i++) {
      try {
        final fileName = '${productId}_${i}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final path = 'products/$fileName';

        await _supabase.storage
            .from(SupabaseConfig.productImagesBucket)
            .upload(path, imageFiles[i]);

        final imageUrl = _supabase.storage
            .from(SupabaseConfig.productImagesBucket)
            .getPublicUrl(path);

        imageUrls.add(imageUrl);
      } catch (e) {
        print('Error uploading image $i: $e');
      }
    }

    return imageUrls;
  }

  // Upload profile picture
  Future<String?> uploadProfilePicture(File imageFile, String userId) async {
    try {
      final fileName = '${userId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final path = 'profiles/$fileName';

      await _supabase.storage
          .from(SupabaseConfig.profileImagesBucket)
          .upload(path, imageFile);

      final imageUrl = _supabase.storage
          .from(SupabaseConfig.profileImagesBucket)
          .getPublicUrl(path);

      return imageUrl;
    } catch (e) {
      print('Error uploading profile picture: $e');
      return null;
    }
  }

  // Delete image
  Future<void> deleteImage(String bucket, String path) async {
    try {
      await _supabase.storage.from(bucket).remove([path]);
    } catch (e) {
      print('Error deleting image: $e');
    }
  }

  // Delete multiple images
  Future<void> deleteImages(String bucket, List<String> paths) async {
    try {
      await _supabase.storage.from(bucket).remove(paths);
    } catch (e) {
      print('Error deleting images: $e');
    }
  }

  // Get image URL from path
  String getImageUrl(String bucket, String path) {
    return _supabase.storage.from(bucket).getPublicUrl(path);
  }
}
