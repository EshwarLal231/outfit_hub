import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../config/theme/app_theme.dart';
import '../../widgets/stat_card.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
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
                    AppTheme.adminColor,
                    AppTheme.adminColor.withOpacity(0.7),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.adminColor.withOpacity(0.3),
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
                        child: Icon(
                          Icons.admin_panel_settings,
                          size: 35,
                          color: AppTheme.adminColor,
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
                              user?.name ?? 'Admin',
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
                    'Manage your Outfit Hub platform',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Statistics Section
            Text(
              'Platform Statistics',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            // Stats Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.3,
              children: const [
                StatCard(
                  title: 'Total Users',
                  value: '1,234',
                  icon: Icons.people_outline,
                  color: Color(0xFF3498DB),
                  trend: '+12%',
                ),
                StatCard(
                  title: 'Total Products',
                  value: '5,678',
                  icon: Icons.shopping_bag_outlined,
                  color: Color(0xFF9B59B6),
                  trend: '+8%',
                ),
                StatCard(
                  title: 'Total Orders',
                  value: '890',
                  icon: Icons.receipt_long_outlined,
                  color: Color(0xFFE67E22),
                  trend: '+15%',
                ),
                StatCard(
                  title: 'Revenue',
                  value: 'PKR 45K',
                  icon: Icons.attach_money,
                  color: Color(0xFF27AE60),
                  trend: '+20%',
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Quick Actions Section
            Text(
              'Quick Actions',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            
            _buildActionCard(
              context,
              'Manage Users',
              'View and manage registered users',
              Icons.people,
              AppTheme.primaryColor,
              () {
                // TODO: Navigate to user management
              },
            ),
            const SizedBox(height: 12),
            
            _buildActionCard(
              context,
              'Manage Products',
              'Review and moderate product listings',
              Icons.inventory_2_outlined,
              AppTheme.secondaryColor,
              () {
                // TODO: Navigate to product management
              },
            ),
            const SizedBox(height: 12),
            
            _buildActionCard(
              context,
              'Reported Content',
              'Handle reported products and users',
              Icons.flag_outlined,
              AppTheme.errorColor,
              () {
                // TODO: Navigate to reported content
              },
            ),
            const SizedBox(height: 12),
            
            _buildActionCard(
              context,
              'Analytics',
              'View detailed platform analytics',
              Icons.analytics_outlined,
              AppTheme.successColor,
              () {
                // TODO: Navigate to analytics
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionCard(
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
