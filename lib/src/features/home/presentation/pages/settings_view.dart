import 'package:flutter/material.dart';
import 'settings/settings_header.dart';
import 'settings/settings_menu_item.dart';
import 'settings/personal_information_page.dart';
import 'settings/change_password_page.dart';
import 'settings/notifications_page.dart';
import 'settings/location_time_page.dart';
import 'settings/account_family_page.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const SettingsHeader(),
            const SizedBox(height: 24),

            // Settings Menu Items
            SettingsMenuItem(
              icon: Icons.person,
              title: 'Personal Information',
              iconColor: const Color(0xFFFF6B9D),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PersonalInformationPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            SettingsMenuItem(
              icon: Icons.lock,
              title: 'Change Password',
              iconColor: const Color(0xFF00BCD4),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangePasswordPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            SettingsMenuItem(
              icon: Icons.notifications,
              title: 'Notifications',
              iconColor: const Color(0xFFFF6B6B),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotificationsPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            SettingsMenuItem(
              icon: Icons.location_on,
              title: 'Location and Time',
              iconColor: const Color(0xFFFFB74D),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocationTimePage()),
                );
              },
            ),
            const SizedBox(height: 12),
            SettingsMenuItem(
              icon: Icons.people,
              title: 'Account & Family',
              iconColor: const Color(0xFF00BCD4),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AccountFamilyPage()),
                );
              },
            ),
            const SizedBox(height: 12),
            SettingsMenuItem(
              icon: Icons.shopping_bag,
              title: 'Manage Plan',
              iconColor: const Color(0xFFFF6B9D),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Manage Plan feature coming soon')),
                );
              },
            ),
            const SizedBox(height: 12),
            SettingsMenuItem(
              icon: Icons.help,
              title: 'Help & Support',
              iconColor: const Color(0xFF00BCD4),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Help & Support feature coming soon')),
                );
              },
            ),
            const SizedBox(height: 12),
            SettingsMenuItem(
              icon: Icons.privacy_tip,
              title: 'Privacy Policy',
              iconColor: const Color(0xFFB366FF),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Privacy Policy feature coming soon')),
                );
              },
            ),
            const SizedBox(height: 12),
            SettingsMenuItem(
              icon: Icons.description,
              title: 'Terms of Service',
              iconColor: const Color(0xFFFF6B9D),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Terms of Service feature coming soon')),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
