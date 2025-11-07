import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../config/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Outfit Hub'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Show notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authProvider.logout();
              if (context.mounted) {
                context.go('/login');
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primaryColor,
                    AppTheme.secondaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primaryColor.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Text(
                          user?.name.substring(0, 1).toUpperCase() ?? 'U',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Welcome Back!',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              user?.name ?? 'User',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Discover sustainable fashion deals',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Quick Stats
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Listings',
                    user?.totalTransactions.toString() ?? '0',
                    Icons.inventory_2_outlined,
                    AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Rating',
                    user?.rating.toString() ?? '0.0',
                    Icons.star_outline,
                    AppTheme.accentColor,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Categories Section
            Text(
              'Browse Categories',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5,
              children: [
                _buildCategoryCard(
                  'Women',
                  Icons.woman,
                  const Color(0xFFFF6B9D),
                ),
                _buildCategoryCard(
                  'Men',
                  Icons.man,
                  const Color(0xFF6B4CE6),
                ),
                _buildCategoryCard(
                  'Kids',
                  Icons.child_care,
                  const Color(0xFFFFC145),
                ),
                _buildCategoryCard(
                  'Accessories',
                  Icons.watch_outlined,
                  const Color(0xFF27AE60),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Quick Actions
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            _buildActionButton(
              context,
              'Browse Products',
              'Discover sustainable fashion deals',
              Icons.shopping_bag_outlined,
              AppTheme.primaryColor,
              () {
                context.push('/browse');
              },
            ),
            const SizedBox(height: 12),
            
            // Show seller option if user is seller or both
            if (user?.role == 'seller' || user?.role == 'both') ...[
              _buildActionButton(
                context,
                'Seller Dashboard',
                'Manage your listings and sales',
                Icons.store_outlined,
                AppTheme.accentColor,
                () {
                  context.push('/seller/dashboard');
                },
              ),
              const SizedBox(height: 12),
            ],
            
            _buildActionButton(
              context,
              'Sell an Item',
              'List your pre-owned fashion items',
              Icons.add_circle_outline,
              user?.role == 'seller' || user?.role == 'both' 
                  ? AppTheme.successColor 
                  : AppTheme.secondaryColor,
              () {
                if (user?.role == 'seller' || user?.role == 'both') {
                  context.push('/seller/add-product');
                } else {
                  // TODO: Show upgrade to seller dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please create a seller account to list items'),
                    ),
                  );
                }
              },
            ),
            const SizedBox(height: 12),
            
            _buildActionButton(
              context,
              'My Orders',
              'Track your orders and purchases',
              Icons.shopping_bag_outlined,
              AppTheme.secondaryColor,
              () {
                // TODO: Navigate to orders
              },
            ),
            const SizedBox(height: 12),
            
            _buildActionButton(
              context,
              'My Listings',
              'Manage your product listings',
              Icons.inventory_outlined,
              AppTheme.accentColor,
              () {
                // TODO: Navigate to listings
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: AppTheme.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: AppTheme.textSecondaryColor,
            fontSize: 13,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppTheme.textSecondaryColor,
        ),
      ),
    );
  }
}
