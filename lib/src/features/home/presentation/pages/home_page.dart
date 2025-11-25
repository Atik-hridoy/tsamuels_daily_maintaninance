import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('TSamuels'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: controller.navigateToProfile,
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Obx(() => IndexedStack(
        index: controller.currentIndex.value,
        children: [
          _buildHomeContent(),
          _buildSearchContent(),
          _buildFavoritesContent(),
        ],
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changeTabIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.navigateToSettings,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.settings, color: Colors.white),
      ),
    );
  }

  Widget _buildHomeContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade400, Colors.blue.shade600],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home, size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    'Welcome Home',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: [
                _buildFeatureCard('Profile', Icons.person, Colors.green),
                _buildFeatureCard('Settings', Icons.settings, Colors.orange),
                _buildFeatureCard('About', Icons.info, Colors.purple),
                _buildFeatureCard('Help', Icons.help, Colors.red),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 100, color: Colors.grey),
          SizedBox(height: 20),
          Text(
            'Search Feature',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Search functionality coming soon'),
        ],
      ),
    );
  }

  Widget _buildFavoritesContent() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, size: 100, color: Colors.red),
          SizedBox(height: 20),
          Text(
            'Favorites',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text('Your favorite items will appear here'),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: color),
          const SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
