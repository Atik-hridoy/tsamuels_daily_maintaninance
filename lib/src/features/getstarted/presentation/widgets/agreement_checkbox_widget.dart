import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/getstarted_controller.dart';

class AgreementCheckboxWidget extends StatelessWidget {
  final GetStartedController controller;

  const AgreementCheckboxWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() => Checkbox(
          value: controller.agreeToTerms.value,
          onChanged: (value) {
            controller.agreeToTerms.value = value ?? false;
          },
          activeColor: const Color(0xFF2196F3),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              'I agree to receive text messages from myAnchor for login verifications. Msg&data rates may apply. Reply STOP to opt out.',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade700,
                height: 1.4,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
