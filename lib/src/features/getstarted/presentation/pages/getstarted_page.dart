import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/getstarted_controller.dart';
import '../widgets/getstarted_header.dart';
import '../widgets/getstarted_form.dart';
import '../widgets/error_message_widget.dart';
import '../widgets/agreement_checkbox_widget.dart';
import '../widgets/continue_button_widget.dart';
import '../widgets/pagination_dots_widget.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<GetStartedController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildPageContent(controller),
    );
  }
  
  Widget _buildPageContent(GetStartedController controller) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header
            const GetStartedHeader(),
            
            // Error Message
            ErrorMessageWidget(controller: controller),
            const SizedBox(height: 20),
            
            // Form Card
            GetStartedForm(controller: controller),
            const SizedBox(height: 20),
            
            // Agreement Checkbox
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: AgreementCheckboxWidget(controller: controller),
            ),
            const SizedBox(height: 12),
            
            // Privacy notice
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                'Your privacy is our utmost concern. Your data will never be shared',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ContinueButtonWidget(controller: controller),
            ),
            const SizedBox(height: 30),
            
            // Pagination dots
            const PaginationDotsWidget(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
