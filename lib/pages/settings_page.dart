import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_project/DI/service_locator.dart';
import 'package:mobile_project/constants/language_code.dart';
import 'package:mobile_project/features/setting/state/settings_cubit.dart';

@RoutePage()
class SettingsPage extends StatelessWidget implements AutoRouteWrapper {
  const SettingsPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingsCubit>(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          // Account Section
          _buildSectionHeader('Account'),
          _buildProfileTile(context),
          _buildAddressTile(context),
          
          const Divider(height: 32),
          
          // App Settings
          _buildSectionHeader('App Settings'),
          _buildLanguageTile(context),
          // _buildThemeTile(context),
          
          const Divider(height: 32),
          
          // About & Support
          _buildSectionHeader('About & Support'),
          _buildHelpTile(context),
          _buildVersionTile(),
          
          const Divider(height: 32),
          
          // Logout
          _buildLogoutTile(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buildProfileTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.person_outline),
      title: const Text('Profile'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Navigate to profile
      },
    );
  }

  Widget _buildAddressTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.location_on_outlined),
      title: const Text('My Addresses'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Navigate to addresses
      },
    );
  }

  Widget _buildLanguageTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.language),
      title: const Text('Language'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => _showLanguageDialog(context),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Language'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildLanguageOption(context, 'English', LanguageCode.en),
            _buildLanguageOption(context, 'Lao', LanguageCode.lo),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => context.maybePop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageOption(BuildContext context, String name, String code) {
    return ListTile(
      title: Text(name),
      onTap: () {
        context.setLocale(Locale(code));
        context.maybePop();
      },
    );
  }

  Widget _buildHelpTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.help_outline),
      title: const Text('Help & Support'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Navigate to help
      },
    );
  }

  Widget _buildVersionTile() {
    return const ListTile(
      leading: Icon(Icons.info_outline),
      title: Text('Version'),
      subtitle: Text('1.0.0'),
    );
  }

  Widget _buildLogoutTile(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const Text('Logout', style: TextStyle(color: Colors.red)),
      onTap: () => _showLogoutDialog(context),
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
              context.maybePop();
            },
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}