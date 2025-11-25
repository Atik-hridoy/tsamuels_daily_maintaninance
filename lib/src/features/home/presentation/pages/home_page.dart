import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/smart_notification_card.dart';
import '../widgets/daily_digest_card.dart';
import '../widgets/forecast_card.dart';
import 'calendar_view.dart';
import 'countdowns_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: SafeArea(
        child: Obx(() => IndexedStack(
          index: controller.currentIndex.value,
          children: [
            _buildDashboard(),
            _buildCalendarTab(),
            _buildCountdownsTab(),
            _buildFamilyTab(),
            _buildSettingsTab(),
          ],
        )),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTabIndex,
        selectedItemColor: Colors.cyan,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.celebration),
            label: 'Countdowns',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Family',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      )),
    );
  }

  Widget _buildDashboard() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const DashboardHeader(),
            const SizedBox(height: 24),

            // Smart Notifications Card
            SmartNotificationCard(
              title: 'Smart Notifications',
              subtitle: 'Stay on track automatically',
              imagePath: 'assets/icons/on5.png',
              items: const ['Road Trip', 'in 2h'],
            ),
            const SizedBox(height: 16),

            // Daily Digest Card
            const DailyDigestCard(),
            const SizedBox(height: 16),

            // 7-Day Forecast Card
            const ForecastCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }


  Widget _buildCalendarTab() {
    return const CalendarView();
  }

  Widget _buildCountdownsTab() {
    return const CountdownsView();
  }

  Widget _buildFamilyTab() {
    return const Center(
      child: Text('Family Tab'),
    );
  }

  Widget _buildSettingsTab() {
    return const Center(
      child: Text('Settings Tab'),
    );
  }
}
