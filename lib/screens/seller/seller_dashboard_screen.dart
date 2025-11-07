import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../config/theme/app_theme.dart';
import '../../widgets/stat_card.dart';

class SellerDashboardScreen extends StatelessWidget {
  const SellerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seller Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Show notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              context.go('/home');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome Card for Sellers
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.accentColor,
                    AppTheme.primaryColor,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.accentColor.withOpacity(0.3),
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
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.store,
                          size: 32,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Your Shop',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              user?.name ?? 'Seller',
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
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.white, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        '${user?.rating ?? 0.0} Rating',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Icon(Icons.verified, color: Colors.white, size: 20),
                      const SizedBox(width: 4),
                      Text(
                        user?.isVerified == true ? 'Verified' : 'Not Verified',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Stats Row
            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Active Listings',
                    value: '12', // TODO: Get from provider
                    icon: Icons.inventory_2_outlined,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Total Sales',
                    value: '${user?.totalTransactions ?? 0}',
                    icon: Icons.monetization_on_outlined,
                    color: AppTheme.successColor,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Revenue',
                    value: 'Rs. 45K', // TODO: Get from provider
                    icon: Icons.account_balance_wallet_outlined,
                    color: AppTheme.accentColor,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: StatCard(
                    title: 'Views',
                    value: '234', // TODO: Get from provider
                    icon: Icons.visibility_outlined,
                    color: AppTheme.secondaryColor,
                  ),
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
              'Add New Product',
              'List a new item for sale',
              Icons.add_circle_outline,
              AppTheme.primaryColor,
              () {
                context.push('/seller/add-product');
              },
            ),
            const SizedBox(height: 12),

            _buildActionButton(
              context,
              'My Listings',
              'View and manage your products',
              Icons.inventory_outlined,
              AppTheme.accentColor,
              () {
                // TODO: Navigate to my listings
              },
            ),
            const SizedBox(height: 12),

            _buildActionButton(
              context,
              'Orders',
              'Track your sales and orders',
              Icons.receipt_long_outlined,
              AppTheme.successColor,
              () {
                // TODO: Navigate to orders
              },
            ),
            const SizedBox(height: 12),

            _buildActionButton(
              context,
              'Analytics',
              'View your sales performance',
              Icons.bar_chart_outlined,
              AppTheme.secondaryColor,
              () {
                // TODO: Navigate to analytics
              },
            ),

            const SizedBox(height: 24),

            // Recent Activity
            Text(
              'Recent Activity',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            _buildActivityItem(
              'New order received',
              'Summer Dress - Size M',
              'Rs. 2,500',
              Icons.shopping_bag,
              AppTheme.successColor,
              '2 hours ago',
            ),
            const SizedBox(height: 12),

            _buildActivityItem(
              'Product viewed',
              'Denim Jacket - Size L',
              '15 views',
              Icons.visibility,
              AppTheme.primaryColor,
              '5 hours ago',
            ),
            const SizedBox(height: 12),

            _buildActivityItem(
              'Product liked',
              'Casual Shirt - Size M',
              '3 likes',
              Icons.favorite,
              AppTheme.secondaryColor,
              '1 day ago',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/seller/add-product');
        },
        backgroundColor: AppTheme.primaryColor,
        icon: const Icon(Icons.add),
        label: const Text('Add Product'),
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

  Widget _buildActivityItem(
    String title,
    String subtitle,
    String value,
    IconData icon,
    Color color,
    String time,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  time,
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
