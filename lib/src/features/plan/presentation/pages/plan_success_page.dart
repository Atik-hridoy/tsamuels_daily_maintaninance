import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/plan_controller.dart';

import '../widgets/success_logo.dart';
import '../widgets/success_message.dart';
import '../widgets/success_button.dart';
import '../widgets/success_loader.dart';

class PlanSuccessPage extends StatelessWidget {
  const PlanSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlanController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              const SuccessLogo(),
              
              // Success message
              const SuccessMessage(
                title: "You're anchored in!",
                subtitle: 'Welcome, Test Family!',
                description: 'Your family is now connected, organized, and ready for calmer days ahead.',
              ),
              
              // Button
              SuccessButton(
                onPressed: () => controller.enterMyAnchor(),
                label: 'Enter myAnchor',
              ),
              
              // Loading dots
              const SuccessLoader(),
            ],
          ),
        ),
      ),
    );
  }
}
