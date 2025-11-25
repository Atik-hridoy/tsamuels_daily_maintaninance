import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/plan_controller.dart';

class PlanButton extends StatelessWidget {
  final PlanController controller;

  const PlanButton({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final planName = controller.selectedPlan.value == 'free'
          ? 'Free Trial'
          : controller.selectedPlan.value == 'dual'
              ? 'Dual Admin'
              : 'Family Plan';

      return Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF00BCD4), Color(0xFF0097A7)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.cyan.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ElevatedButton(
          onPressed: controller.continueTapped,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Text(
            'Continue with $planName',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      );
    });
  }
}
