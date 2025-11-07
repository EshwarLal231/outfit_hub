import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/theme/app_theme.dart';
import '../../models/product_model.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  String _selectedCategory = 'all';
  String _selectedSort = 'latest';

  // Mock products - TODO: Get from provider/API
  final List<ProductModel> _mockProducts = [
    ProductModel(
      id: '1',
      sellerId: 'seller001',
      sellerName: 'Jane Smith',
      title: 'Summer Floral Dress',
      description: 'Beautiful summer dress in excellent condition',
      price: 2500,
      category: 'women',
      condition: 'like-new',
      size: 'M',
      brand: 'H&M',
      images: ['https://via.placeholder.com/300'],
      colors: ['Blue', 'White'],
      location: 'Karachi',
      views: 45,
      likes: 12,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
    ),
    ProductModel(
      id: '2',
      sellerId: 'seller001',
      sellerName: 'Jane Smith',
      title: 'Denim Jacket',
      description: 'Classic denim jacket, perfect for casual wear',
      price: 3500,
      category: 'women',
      condition: 'good',
      size: 'L',
      brand: 'Levi\'s',
      images: ['https://via.placeholder.com/300'],
      colors: ['Blue'],
      location: 'Lahore',
      views: 89,
      likes: 24,
      createdAt: DateTime.now().subtract(const Duration(days: 5)),
    ),
    ProductModel(
      id: '3',
      sellerId: 'seller002',
      sellerName: 'Ali Khan',
      title: 'Men\'s Formal Shirt',
      description: 'White formal shirt, barely used',
      price: 1500,
      category: 'men',
      condition: 'new',
      size: 'L',
      brand: 'Khaadi',
      images: ['https://via.placeholder.com/300'],
      colors: ['White'],
      location: 'Islamabad',
      views: 56,
      likes: 8,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  List<ProductModel> get filteredProducts {
    var products = _mockProducts;
    
    // Filter by category
    if (_selectedCategory != 'all') {
      products = products.where((p) => p.category == _selectedCategory).toList();
    }

    // Sort
    switch (_selectedSort) {
      case 'price_low':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_high':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'popular':
        products.sort((a, b) => b.views.compareTo(a.views));
        break;
      case 'latest':
      default:
        products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        break;
    }

    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Browse Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              _showFilterSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Category Filter
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildCategoryChip('All', 'all'),
                _buildCategoryChip('Women', 'women'),
                _buildCategoryChip('Men', 'men'),
                _buildCategoryChip('Kids', 'kids'),
                _buildCategoryChip('Accessories', 'accessories'),
              ],
            ),
          ),

          // Products Grid
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 64,
                          color: AppTheme.textSecondaryColor,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No products found',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppTheme.textSecondaryColor,
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      return _buildProductCard(filteredProducts[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, String value) {
    final isSelected = _selectedCategory == value;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (selected) {
          setState(() {
            _selectedCategory = value;
          });
        },
        selectedColor: AppTheme.primaryColor,
        checkmarkColor: Colors.white,
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : AppTheme.textPrimaryColor,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildProductCard(ProductModel product) {
    return GestureDetector(
      onTap: () {
        context.push('/product/${product.id}');
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Stack(
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.checkroom,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.successColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      product.conditionBadge,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      product.brand,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.formattedPrice,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                        Icon(
                          Icons.favorite_border,
                          size: 20,
                          color: AppTheme.textSecondaryColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sort By',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildSortOption('Latest', 'latest'),
            _buildSortOption('Price: Low to High', 'price_low'),
            _buildSortOption('Price: High to Low', 'price_high'),
            _buildSortOption('Most Popular', 'popular'),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSortOption(String label, String value) {
    return RadioListTile<String>(
      title: Text(label),
      value: value,
      groupValue: _selectedSort,
      activeColor: AppTheme.primaryColor,
      onChanged: (val) {
        setState(() {
          _selectedSort = val!;
        });
        Navigator.pop(context);
      },
    );
  }
}
