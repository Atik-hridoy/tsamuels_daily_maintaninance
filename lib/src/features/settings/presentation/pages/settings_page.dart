import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Obx(() => SwitchListTile(
                    title: const Text('Dark Mode'),
                    subtitle: const Text('Toggle dark theme'),
                    value: controller.isDarkMode.value,
                    onChanged: controller.toggleDarkMode,
                    secondary: const Icon(Icons.dark_mode),
                  )),
                  const Divider(),
                  Obx(() => SwitchListTile(
                    title: const Text('Notifications'),
                    subtitle: const Text('Enable push notifications'),
                    value: controller.notificationsEnabled.value,
                    onChanged: controller.toggleNotifications,
                    secondary: const Icon(Icons.notifications),
                  )),
                  const Divider(),
                  ListTile(
                    title: const Text('Language'),
                    subtitle: const Text('English'),
                    leading: const Icon(Icons.language),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.snackbar('Info', 'Language settings coming soon');
                    },
                  ),
                  const Divider(),
                  ListTile(
                    title: const Text('About'),
                    leading: const Icon(Icons.info),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      Get.defaultDialog(
                        title: 'About',
                        content: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('TSamuels App'),
                            SizedBox(height: 10),
                            Text('Version 1.0.0'),
                            SizedBox(height: 10),
                            Text('A professional Flutter application'),
                          ],
                        ),
                        confirm: TextButton(
                          onPressed: () => Get.back(),
                          child: const Text('OK'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: ListTile(
                title: const Text('Logout', style: TextStyle(color: Colors.red)),
                subtitle: const Text('Sign out of your account'),
                leading: const Icon(Icons.logout, color: Colors.red),
                onTap: () {
                  Get.defaultDialog(
                    title: 'Logout',
                    content: const Text('Are you sure you want to logout?'),
                    confirm: TextButton(
                      onPressed: controller.logout,
                      child: const Text('Yes', style: TextStyle(color: Colors.red)),
                    ),
                    cancel: TextButton(
                      onPressed: () => Get.back(),
                      child: const Text('No'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
