import 'package:get/get.dart';

class HomeController extends GetxController {
  final currentIndex = 0.obs;
  
  void changeTabIndex(int index) {
    currentIndex.value = index;
  }
  
  void navigateToProfile() {
    Get.toNamed('/profile');
  }
  
  void navigateToSettings() {
    Get.toNamed('/settings');
  }
}
