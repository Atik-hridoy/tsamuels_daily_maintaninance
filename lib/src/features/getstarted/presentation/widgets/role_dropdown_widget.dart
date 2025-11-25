import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/getstarted_controller.dart';

class RoleDropdownWidget extends StatelessWidget {
  final GetStartedController controller;

  const RoleDropdownWidget({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: controller.selectedRole.value.isEmpty ? null : controller.selectedRole.value,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Choose role',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade400,
            ),
          ),
        ),
        isExpanded: true,
        underline: const SizedBox(),
        items: ['Parent', 'Guardian', 'Caregiver', 'Other']
            .map((role) => DropdownMenuItem(
              value: role,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(role),
              ),
            ))
            .toList(),
        onChanged: (value) {
          if (value != null) {
            controller.selectedRole.value = value;
          }
        },
      ),
    ));
  }
}
