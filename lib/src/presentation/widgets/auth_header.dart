import 'package:flutter/material.dart';
import '../../constants/app_assets.dart';
import '../../constants/app_strings.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AppAssets.authLogo2,
          width: 80,
          height: 80,
        ),
        const SizedBox(height: 20),
        Text(
          AppStrings.welcomeToMyAnchor,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          AppStrings.signInToContinue,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
