import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class RouteManager {
  static void navigateToAuth() {
    Get.offAllNamed(Routes.auth);
  }
  
  static void navigateToHome() {
    Get.offAllNamed(Routes.home);
  }
  
  static void navigateToProfile() {
    Get.toNamed(Routes.profile);
  }
  
  static void navigateToSettings() {
    Get.toNamed(Routes.settings);
  }
  
  static void goBack() {
    Get.back();
  }
  
  static void replaceWith(String route) {
    Get.offNamed(route);
  }
  
  static void offAllTo(String route) {
    Get.offAllNamed(route);
  }
  
  static String get currentRoute => Get.currentRoute;
  
  static bool get canGoBack => Navigator.canPop(Get.context!);
  
  static void showSnackbar(String title, String message) {
    Get.snackbar(title, message);
  }
  
  static void showDialog(String title, String content) {
    Get.defaultDialog(
      title: title,
      content: Text(content),
      confirm: TextButton(
        onPressed: () => Get.back(),
        child: const Text('OK'),
      ),
    );
  }
}
