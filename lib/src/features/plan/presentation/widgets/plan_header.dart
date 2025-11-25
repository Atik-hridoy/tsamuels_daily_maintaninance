import 'package:flutter/material.dart';

class PlanHeader extends StatelessWidget {
  const PlanHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Title
        Text(
          'Choose a plan',
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        
        // Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Every plan includes every feature. Just choose how many admin users you need.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
