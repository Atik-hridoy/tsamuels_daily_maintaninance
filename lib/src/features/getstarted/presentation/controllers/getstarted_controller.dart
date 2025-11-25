import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetStartedController extends GetxController {
  final familyNameController = TextEditingController();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  
  final selectedRole = ''.obs;
  final agreeToTerms = false.obs;
  final validationError = ''.obs;
  
  void continuePressed() {
    // Clear previous error
    validationError.value = '';
    
    // Validate form
    if (familyNameController.text.isEmpty) {
      validationError.value = 'Please enter family name';
      return;
    }
    
    if (fullNameController.text.isEmpty) {
      validationError.value = 'Please enter your full name';
      return;
    }
    
    if (phoneController.text.isEmpty) {
      validationError.value = 'Please enter phone number';
      return;
    }
    
    if (emailController.text.isEmpty) {
      validationError.value = 'Please enter email';
      return;
    }
    
    if (selectedRole.value.isEmpty) {
      validationError.value = 'Please select a role';
      return;
    }
    
    if (!agreeToTerms.value) {
      validationError.value = 'Please agree to receive text messages';
      return;
    }
    
    // All validations passed - proceed to plan selection
    Get.offNamed('/plan');
  }
  
  @override
  void onClose() {
    familyNameController.dispose();
    fullNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
