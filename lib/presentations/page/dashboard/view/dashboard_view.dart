import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dashboard_controller.dart';

// Import semua halaman yang sudah dibuat
import 'package:idehris/presentations/page/home/view/home_view.dart';
import 'package:idehris/presentations/page/chat/view/chat_view.dart';
import 'package:idehris/presentations/page/notification/view/notification_view.dart';
import 'package:idehris/presentations/page/profile/view/profile_view.dart';

import 'package:idehris/presentations/reusable_widget/customNavBarItem/custom_navbar_item.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    final List<Widget> pages = [
      const HomeView(),
      const ChatView(),
      const NotificationView(),
      const ProfileView(),
    ];

    return Scaffold(
      body: Obx(() => pages[controller.selectedIndex.value]),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SafeArea(
          bottom: true,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
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
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomNavBarItem(
                    label: "Utama",
                    icon: Icons.home,
                    iconDisabled: Icons.home_outlined,
                    selected: controller.selectedIndex.value == 0,
                    onTap: () => controller.selectedIndex.value = 0,
                  ),
                  CustomNavBarItem(
                    label: "Obrolan",
                    icon: Icons.chat_bubble,
                    iconDisabled: Icons.chat_bubble_outline,
                    selected: controller.selectedIndex.value == 1,
                    onTap: () => controller.selectedIndex.value = 1,
                  ),
                  CustomNavBarItem(
                    label: "Notifikasi",
                    icon: Icons.notifications,
                    iconDisabled: Icons.notifications_none,
                    selected: controller.selectedIndex.value == 2,
                    onTap: () => controller.selectedIndex.value = 2,
                  ),
                  CustomNavBarItem(
                    label: "Profil",
                    icon: Icons.person,
                    iconDisabled: Icons.person_outline,
                    selected: controller.selectedIndex.value == 3,
                    onTap: () => controller.selectedIndex.value = 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
