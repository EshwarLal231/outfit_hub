import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../config/theme/app_theme.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _brandController = TextEditingController();
  
  String _selectedCategory = 'women';
  String _selectedCondition = 'good';
  String _selectedSize = 'M';
  bool _isLoading = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _brandController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      setState(() {
        _isLoading = false;
      });

      if (mounted) {
        Fluttertoast.showToast(
          msg: "Product added successfully!",
          backgroundColor: AppTheme.successColor,
        );
        context.go('/seller/dashboard');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image Upload Placeholder
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.borderColor, width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Tap to add photos',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'Add up to 5 photos',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Title
              CustomTextField(
                controller: _titleController,
                label: 'Product Title',
                hint: 'e.g., Summer Floral Dress',
                prefixIcon: Icons.title,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Description
              CustomTextField(
                controller: _descriptionController,
                label: 'Description',
                hint: 'Describe your product...',
                prefixIcon: Icons.description,
                maxLines: 4,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Price
              CustomTextField(
                controller: _priceController,
                label: 'Price (Rs.)',
                hint: 'e.g., 2500',
                prefixIcon: Icons.attach_money,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter price';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Brand
              CustomTextField(
                controller: _brandController,
                label: 'Brand',
                hint: 'e.g., H&M, Zara, etc.',
                prefixIcon: Icons.local_offer,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter brand name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Category
              Text(
                'Category',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _buildChoiceChip('Women', 'women', _selectedCategory, (val) {
                    setState(() => _selectedCategory = val);
                  }),
                  _buildChoiceChip('Men', 'men', _selectedCategory, (val) {
                    setState(() => _selectedCategory = val);
                  }),
                  _buildChoiceChip('Kids', 'kids', _selectedCategory, (val) {
                    setState(() => _selectedCategory = val);
                  }),
                  _buildChoiceChip('Accessories', 'accessories', _selectedCategory, (val) {
                    setState(() => _selectedCategory = val);
                  }),
                ],
              ),
              const SizedBox(height: 16),

              // Condition
              Text(
                'Condition',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _buildChoiceChip('New', 'new', _selectedCondition, (val) {
                    setState(() => _selectedCondition = val);
                  }),
                  _buildChoiceChip('Like New', 'like-new', _selectedCondition, (val) {
                    setState(() => _selectedCondition = val);
                  }),
                  _buildChoiceChip('Good', 'good', _selectedCondition, (val) {
                    setState(() => _selectedCondition = val);
                  }),
                  _buildChoiceChip('Fair', 'fair', _selectedCondition, (val) {
                    setState(() => _selectedCondition = val);
                  }),
                ],
              ),
              const SizedBox(height: 16),

              // Size
              Text(
                'Size',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: [
                  _buildChoiceChip('XS', 'XS', _selectedSize, (val) {
                    setState(() => _selectedSize = val);
                  }),
                  _buildChoiceChip('S', 'S', _selectedSize, (val) {
                    setState(() => _selectedSize = val);
                  }),
                  _buildChoiceChip('M', 'M', _selectedSize, (val) {
                    setState(() => _selectedSize = val);
                  }),
                  _buildChoiceChip('L', 'L', _selectedSize, (val) {
                    setState(() => _selectedSize = val);
                  }),
                  _buildChoiceChip('XL', 'XL', _selectedSize, (val) {
                    setState(() => _selectedSize = val);
                  }),
                  _buildChoiceChip('XXL', 'XXL', _selectedSize, (val) {
                    setState(() => _selectedSize = val);
                  }),
                ],
              ),
              const SizedBox(height: 32),

              // Submit Button
              CustomButton(
                text: 'List Product',
                onPressed: _isLoading ? null : _handleSubmit,
                isLoading: _isLoading,
              ),
              const SizedBox(height: 16),

              // Cancel Button
              OutlinedButton(
                onPressed: () => context.pop(),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceChip(
    String label,
    String value,
    String selectedValue,
    Function(String) onSelected,
  ) {
    final isSelected = selectedValue == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (selected) {
        if (selected) onSelected(value);
      },
      selectedColor: AppTheme.primaryColor,
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : AppTheme.textPrimaryColor,
        fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
      ),
    );
  }
}
