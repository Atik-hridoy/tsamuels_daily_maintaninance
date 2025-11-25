import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/onboarding_controller.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => _buildPageContent(controller)),
    );
  }
  
  Widget _buildPageContent(OnboardingController controller) {
    if (controller.currentPage.value == 1) {
      return _buildSecondScreen(controller);
    } else if (controller.currentPage.value == 2) {
      return _buildThirdScreen(controller);
    } else if (controller.currentPage.value == 3) {
      return _buildFourthScreen(controller);
    } else if (controller.currentPage.value == 4) {
      return _buildFifthScreen(controller);
    } else if (controller.currentPage.value == 5) {
      return _buildSixthScreen(controller);
    }
    
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top section with title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Card with arrows
            _buildCardWithArrows(controller, 'Leave By', 'Get notified 2 hours before you need to arrive. Smart leave-by alerts, powered by real-time traffic, so you leave calm, not hurried.'),
            const SizedBox(height: 30),
            
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4FC3F7), Color(0xFF2196F3)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    controller.buttonText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(1, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(2, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(3, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(4, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(5, controller.currentPage.value),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSecondScreen(OnboardingController controller) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top section with title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Card with arrows
            _buildCardWithArrows(controller, 'Daily Digest', 'Pick your morning time and wake to a friendly Daily Digest, one tap away.'),
            const SizedBox(height: 30),
            
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4FC3F7), Color(0xFF2196F3)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    controller.buttonText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(1, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(2, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(3, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(4, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(5, controller.currentPage.value),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  
  Widget _buildThirdScreen(OnboardingController controller) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top section with title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Card with arrows
            _buildCardWithArrows(controller, 'Instant Event', 'A faster way to add plans on line, no extra steps.'),
            const SizedBox(height: 30),
            
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4FC3F7), Color(0xFF2196F3)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    controller.buttonText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(1, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(2, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(3, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(4, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(5, controller.currentPage.value),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFourthScreen(OnboardingController controller) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top section with title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Card with arrows
            _buildCardWithArrows(controller, 'Countdowns', 'Look forward to the big moments – games, recitals, and milestones.'),
            const SizedBox(height: 30),
            
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4FC3F7), Color(0xFF2196F3)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    controller.buttonText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(1, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(2, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(3, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(4, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(5, controller.currentPage.value),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  
  Widget _buildFifthScreen(OnboardingController controller) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top section with title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Card with arrows
            _buildCardWithArrows(controller, 'Smart Notifications', 'Personalized reminders so you never miss what matters.'),
            const SizedBox(height: 30),
            
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4FC3F7), Color(0xFF2196F3)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    controller.buttonText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(1, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(2, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(3, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(4, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(5, controller.currentPage.value),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  
  Widget _buildSixthScreen(OnboardingController controller) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Top section with title and subtitle
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    controller.title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.subtitle,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            
            // Card with arrows
            _buildCardWithArrows(controller, '7-Day Weather Forecast', 'Plan ahead with weather tied directly to your events.'),
            const SizedBox(height: 30),
            
            // Continue Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4FC3F7), Color(0xFF2196F3)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    controller.buttonText,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Pagination dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(0, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(1, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(2, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(3, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(4, controller.currentPage.value),
                const SizedBox(width: 8),
                _buildDot(5, controller.currentPage.value),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
  
  Widget _buildCardWithArrows(OnboardingController controller, String cardTitle, String cardDescription) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Stack(
        children: [
          // Card
          Container(
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
              children: [
                // Image
                Image.asset(
                  controller.imageAsset,
                  width: 120,
                  height: 120,
                ),
                const SizedBox(height: 20),
                
                // Card title
                Text(
                  cardTitle,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 12),
                
                // Card description
                Text(
                  cardDescription,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          
          // Left arrow on card border
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: controller.currentPage.value > 0 ? controller.previousPage : null,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value > 0 ? Colors.blue.shade100 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.arrow_back,
                    color: controller.currentPage.value > 0 ? const Color(0xFF2196F3) : Colors.grey.shade400,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
          
          // Right arrow on card border
          Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Center(
              child: GestureDetector(
                onTap: controller.currentPage.value < 5 ? controller.nextPage : null,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: controller.currentPage.value < 5 ? Colors.blue.shade100 : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: controller.currentPage.value < 5 ? const Color(0xFF2196F3) : Colors.grey.shade400,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildDot(int index, int currentIndex) {
    final isActive = index == currentIndex;
    return GestureDetector(
      onTap: () => Get.find<OnboardingController>().goToPage(index),
      child: Container(
        width: isActive ? 12 : 8,
        height: isActive ? 12 : 8,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF2196F3) : Colors.grey.shade300,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
