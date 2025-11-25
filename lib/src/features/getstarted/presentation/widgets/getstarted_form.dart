import 'package:flutter/material.dart';
import '../controllers/getstarted_controller.dart';
import 'form_field_widget.dart';
import 'role_dropdown_widget.dart';

class GetStartedForm extends StatelessWidget {
  final GetStartedController controller;

  const GetStartedForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Family Name
            _buildFormLabel('Family Name'),
            const SizedBox(height: 8),
            FormFieldWidget(
              controller: controller.familyNameController,
              hintText: 'e.g. Jones',
            ),
            const SizedBox(height: 20),
            
            // Full Name
            _buildFormLabel('Full Name'),
            const SizedBox(height: 8),
            FormFieldWidget(
              controller: controller.fullNameController,
              hintText: 'Enter your full name',
            ),
            const SizedBox(height: 20),
            
            // Phone Number
            _buildFormLabel('Phone Number'),
            const SizedBox(height: 8),
            FormFieldWidget(
              controller: controller.phoneController,
              hintText: 'Enter your phone number',
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),
            
            // Email
            _buildFormLabel('Email'),
            const SizedBox(height: 8),
            FormFieldWidget(
              controller: controller.emailController,
              hintText: 'Enter your email',
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            
            // Role in Family
            _buildFormLabel('Role in Family'),
            const SizedBox(height: 8),
            RoleDropdownWidget(controller: controller),
          ],
        ),
      ),
    );
  }

  Widget _buildFormLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Colors.black87,
      ),
    );
  }
}
