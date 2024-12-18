import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:mobile_project/routers/app_router.dart';
import 'drawer_item.dart';

class DrawerItemsList extends StatelessWidget {
  const DrawerItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DrawerItem(
          icon: Icons.home_outlined,
          title: 'HomePage',
          onTap: () {
            context.maybePop();
            // Add navigation logic
          },
        ),
        DrawerItem(
          icon: Icons.shopping_cart_outlined,
          title: 'Category',
          onTap: () {
            context.maybePop();
            // Navigate to orders
          },
        ),
        DrawerItem(
          icon: Icons.favorite_border_outlined,
          title: 'support page',
          onTap: () {
            context.maybePop();
            // Navigate to wishlist
          },
        ),
        DrawerItem(
          icon: Icons.location_on_outlined,
          title: 'content copy',
          onTap: () {
            context.maybePop();
            // Navigate to address
          },
        ),
      ],
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              // Implement logout logic
              context.maybePop();
            },
            child: const Text('Logout'),
          ),
        ],
      ),
    );
  }
}
