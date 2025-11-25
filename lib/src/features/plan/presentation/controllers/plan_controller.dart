import 'package:get/get.dart';

class PlanController extends GetxController {
  final selectedPlan = 'family'.obs;
  
  void selectPlan(String plan) {
    selectedPlan.value = plan;
  }
  
  void continueTapped() {
    // Proceed to plan success screen
    Get.toNamed('/plan_success');
  }
  
  void enterMyAnchor() {
    // Proceed to home from success screen
    Get.offAllNamed('/home');
  }
}
