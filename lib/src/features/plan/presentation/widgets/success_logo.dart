import 'package:flutter/material.dart';

class SuccessLogo extends StatelessWidget {
  const SuccessLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Image.asset(
          'assets/icons/authlogo2.png',
          width: 140,
          height: 140,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
