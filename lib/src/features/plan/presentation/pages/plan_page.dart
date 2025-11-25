import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/plan_controller.dart';
import '../widgets/plan_header.dart';
import '../widgets/plan_card.dart';
import '../widgets/plan_features.dart';
import '../widgets/plan_button.dart';
import '../widgets/plan_pagination.dart';

class PlanPage extends StatelessWidget {
  const PlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<PlanController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildPageContent(controller),
    );
  }
  
  Widget _buildPageContent(PlanController controller) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header
            const PlanHeader(),
            const SizedBox(height: 30),
            
            // Plan Cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  // Free Trial
                  PlanCard(
                    title: 'Free Trial',
                    subtitle: 'Up to 2 Admin Users',
                    price: '\$0 /30 days',
                    badge: 'Start Here',
                    badgeColor: Colors.green.shade700,
                    iconColor: Colors.green,
                    icon: Icons.star_outline,
                    isSelected: controller.selectedPlan.value == 'free',
                    onTap: () => controller.selectPlan('free'),
                  ),
                  const SizedBox(height: 16),
                  
                  // Dual Admin
                  PlanCard(
                    title: 'Dual Admin',
                    subtitle: 'Up to 2 Admin Users',
                    price: '\$4.99 /per month',
                    badge: null,
                    badgeColor: Colors.blue,
                    iconColor: Colors.blue,
                    icon: Icons.people_outline,
                    isSelected: controller.selectedPlan.value == 'dual',
                    onTap: () => controller.selectPlan('dual'),
                  ),
                  const SizedBox(height: 16),
                  
                  // Family Plan
                  PlanCard(
                    title: 'Family Plan',
                    subtitle: 'Unlimited Admin Users',
                    price: '\$10.99 /per month',
                    badge: 'Most Popular',
                    badgeColor: Colors.purple,
                    iconColor: Colors.purple,
                    icon: Icons.favorite_outline,
                    isSelected: controller.selectedPlan.value == 'family',
                    onTap: () => controller.selectPlan('family'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // What's Included
            const PlanFeatures(),
            const SizedBox(height: 30),
            
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PlanButton(controller: controller),
            ),
            const SizedBox(height: 30),
            
            // Pagination dots
            const PlanPagination(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
