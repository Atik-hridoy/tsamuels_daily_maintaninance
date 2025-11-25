import 'package:flutter/material.dart';

class GetStartedHeader extends StatelessWidget {
  const GetStartedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Logo
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Image.asset(
            'assets/icons/authlogo2.png',
            width: 80,
            height: 80,
          ),
        ),
        const SizedBox(height: 24),
        
        // Title
        Text(
          "Let's get started",
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        
        // Subtitle
        Text(
          'Tell us about your family',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey.shade600,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
