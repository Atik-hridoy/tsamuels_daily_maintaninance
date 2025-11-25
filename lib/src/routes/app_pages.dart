import 'package:get/get.dart';
import '../features/auth/presentation/bindings/auth_binding.dart';
import '../features/auth/presentation/pages/auth_page.dart';
import '../features/getstarted/presentation/bindings/getstarted_binding.dart';
import '../features/getstarted/presentation/pages/getstarted_page.dart';
import '../features/plan/presentation/bindings/plan_binding.dart';
import '../features/plan/presentation/pages/plan_page.dart';
import '../features/plan/presentation/pages/plan_success_page.dart';
import '../features/home/presentation/bindings/home_binding.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/onboarding/presentation/bindings/onboarding_binding.dart';
import '../features/profile/presentation/bindings/profile_binding.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/settings/presentation/bindings/settings_binding.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/onboarding/presentation/onboarding_page.dart';
import '../presentation/pages/splash_page.dart';
import '../presentation/pages/unknown_page.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.splash;
  //static const initial = Routes.planSuccess;
  
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => const SplashPage(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingPage(),
      binding: OnboardingBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.getstarted,
      page: () => const GetStartedPage(),
      binding: GetStartedBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.plan,
      page: () => const PlanPage(),
      binding: PlanBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.planSuccess,
      page: () => const PlanSuccessPage(),
      binding: PlanBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.auth,
      page: () => const AuthPage(),
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.settings,
      page: () => const SettingsPage(),
      binding: SettingsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.unknown,
      page: () => const UnknownPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
