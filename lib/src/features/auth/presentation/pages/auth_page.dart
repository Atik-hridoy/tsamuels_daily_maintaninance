import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../../../presentation/widgets/auth_header.dart';
import '../../../../presentation/widgets/auth_input_field.dart';
import '../../../../presentation/widgets/auth_button.dart';
import '../../../../presentation/widgets/auth_footer.dart';
import '../../../../constants/app_strings.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFF1976D2), width: 2),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AuthHeader(),
                    const SizedBox(height: 40),
                    AuthInputField(
                      label: AppStrings.email,
                      hintText: AppStrings.emailHint,
                      controller: emailController,
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    AuthInputField(
                      label: AppStrings.password,
                      hintText: AppStrings.passwordHint,
                      obscureText: true,
                      controller: passwordController,
                      prefixIcon: Icons.lock,
                    ),
                    const SizedBox(height: 30),
                    Obx(() => AuthButton(
                      text: AppStrings.signIn,
                      onPressed: () => controller.login(),
                      isLoading: controller.isLoading.value,
                    )),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () => controller.forgotPassword(),
                      child: Text(
                        AppStrings.forgotPassword,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const AuthFooter(),
          ],
        ),
      ),
    );
  }
}
