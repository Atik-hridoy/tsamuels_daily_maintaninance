import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_strings.dart';
import '../../features/auth/presentation/controllers/auth_controller.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.needAccount,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () => controller.signUp(),
              child: Text(
                AppStrings.signUp,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
