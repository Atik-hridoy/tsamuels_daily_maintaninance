import 'package:get/get.dart';
import '../../../../constants/app_strings.dart';

class AuthController extends GetxController {
  final isLoggedIn = false.obs;
  final isLoading = false.obs;
  
  void login() {
    isLoading.value = true;
    
    // Simulate login process
    Future.delayed(const Duration(seconds: 2), () {
      isLoggedIn.value = true;
      isLoading.value = false;
      Get.offAllNamed('/home');
    });
  }
  
  void forgotPassword() {
    Get.snackbar(
      AppStrings.forgotPassword, 
      'Password reset link sent to your email'
    );
  }
  
  void signUp() {
    Get.snackbar(
      AppStrings.signUp, 
      'Sign up feature coming soon'
    );
  }
  
  void logout() {
    isLoggedIn.value = false;
    Get.offAllNamed('/auth');
  }
}
