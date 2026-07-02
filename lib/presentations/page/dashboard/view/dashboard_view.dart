import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Center(
        child: Text("Halaman Utama", style: TextStyle(fontSize: 20)),
      ),
      const Center(
        child: Text("Halaman Obrolan", style: TextStyle(fontSize: 20)),
      ),
      const Center(
        child: Text("Halaman Notifikasi", style: TextStyle(fontSize: 20)),
      ),
      const Center(
        child: Text("Halaman Profil", style: TextStyle(fontSize: 20)),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Obx(() => pages[controller.selectedIndex.value]),

      // Navigation Bar
      bottomNavigationBar: Obx(
        () => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                offset: Offset(0, -1),
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeTabIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedItemColor: const Color(0xFF2D3E9F),
            unselectedItemColor: const Color(0xFFD4D4D4),
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),

            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.home_filled, size: 28),
                ),
                label: "Utama",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.chat_bubble, size: 26),
                ),
                label: "Obrolan",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.notifications, size: 28),
                ),
                label: "Notifikasi",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4),
                  child: Icon(Icons.person, size: 28),
                ),
                label: "Profil",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
