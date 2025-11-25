import 'package:get/get.dart';

class ProfileController extends GetxController {
  final userName = 'John Doe'.obs;
  final userEmail = 'john.doe@example.com'.obs;
  
  void updateProfile(String name, String email) {
    userName.value = name;
    userEmail.value = email;
    Get.snackbar('Success', 'Profile updated successfully');
  }
  
  void goBack() {
    Get.back();
  }
}
