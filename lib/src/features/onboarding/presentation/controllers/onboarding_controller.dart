import 'package:get/get.dart';
import '../../../../constants/app_strings.dart';

class OnboardingController extends GetxController {
  final currentPage = 0.obs;
  final totalPages = 6;
  
  void nextPage() {
    if (currentPage.value < totalPages - 1) {
      currentPage.value++;
    } else {
      // Last page - navigate to getstarted
      Get.offAllNamed('/getstarted');
    }
  }
  
  void previousPage() {
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }
  
  void skipToAuth() {
    Get.offAllNamed('/auth');
  }
  
  void goToPage(int page) {
    if (page >= 0 && page < totalPages) {
      currentPage.value = page;
    }
  }
  
  String get title {
    switch (currentPage.value) {
      case 0:
        return AppStrings.welcomeAboard;
      case 1:
        return AppStrings.trackYourProgress;
      case 2:
        return AppStrings.welcomeAboard; // Can add more titles
      default:
        return AppStrings.welcomeAboard;
    }
  }
  
  String get subtitle {
    switch (currentPage.value) {
      case 0:
        return AppStrings.simpleConnectedTrusted;
      case 1:
        return AppStrings.monitorYourDaily;
      case 2:
        return AppStrings.simpleConnectedTrusted; // Can add more subtitles
      default:
        return AppStrings.simpleConnectedTrusted;
    }
  }
  
  String get buttonText {
    return currentPage.value == totalPages - 1 ? AppStrings.getStarted : AppStrings.next;
  }
  
  String get imageAsset {
    switch (currentPage.value) {
      case 0:
        return 'assets/icons/authlogo2.png';
      case 1:
        return 'assets/icons/onboarding1.png';
      case 2:
        return 'assets/icons/on3.png';
      case 3:
        return 'assets/icons/on4.png';
      case 4:
        return 'assets/icons/on5.png';
      case 5:
        return 'assets/icons/on6.png';
      default:
        return 'assets/icons/authlogo2.png';
    }
  }
}
