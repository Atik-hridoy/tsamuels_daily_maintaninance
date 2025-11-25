import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  final isDarkMode = false.obs;
  final notificationsEnabled = true.obs;
  
  void toggleDarkMode(bool value) {
    isDarkMode.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }
  
  void toggleNotifications(bool value) {
    notificationsEnabled.value = value;
    Get.snackbar('Settings', 'Notifications ${value ? "enabled" : "disabled"}');
  }
  
  void logout() {
    Get.offAllNamed('/auth');
  }
}
