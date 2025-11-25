import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          onPressed: controller.goBack,
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blue.shade100,
                child: const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              controller.userName.value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              controller.userEmail.value,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 30),
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
                  _buildProfileItem('Edit Profile', Icons.edit, () {}),
                  const Divider(),
                  _buildProfileItem('Change Password', Icons.lock, () {}),
                  const Divider(),
                  _buildProfileItem('Notifications', Icons.notifications, () {}),
                  const Divider(),
                  _buildProfileItem('Privacy', Icons.privacy_tip, () {}),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget _buildProfileItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.blue),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
