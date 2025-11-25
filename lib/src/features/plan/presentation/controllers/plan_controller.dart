import 'package:get/get.dart';

class PlanController extends GetxController {
  final selectedPlan = 'family'.obs;
  
  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
  
  void continueTapped() {
    // Proceed to home or next screen
    Get.offAllNamed('/home');
  }
}
