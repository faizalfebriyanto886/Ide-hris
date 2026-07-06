import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idehris/presentations/reusable_widget/customNavBarItem/custom_navbar_item.dart';
import '../controller/main_bar_controller.dart';

class MainBarView extends StatelessWidget {
  const MainBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MainBarController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Obx(() => controller.menuPages[controller.selectedIndex.value]),

      bottomNavigationBar: Container(
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

        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomNavBarItem(
                    label: "Utama",
                    icon: Icons.home,
                    iconDisabled: Icons.home_outlined,
                    selected: controller.selectedIndex.value == 0,
                    onTap: () => controller.setSelectedMenu(0),
                  ),
                  CustomNavBarItem(
                    label: "Obrolan",
                    icon: Icons.message,
                    iconDisabled: Icons.message_outlined,
                    selected: controller.selectedIndex.value == 1,
                    onTap: () => controller.setSelectedMenu(1),
                  ),
                  CustomNavBarItem(
                    label: "Notifikasi",
                    icon: Icons.notifications,
                    iconDisabled: Icons.notifications_outlined,
                    selected: controller.selectedIndex.value == 2,
                    onTap: () => controller.setSelectedMenu(2),
                  ),
                  CustomNavBarItem(
                    label: "Profil",
                    icon: Icons.person,
                    iconDisabled: Icons.person_outlined,
                    selected: controller.selectedIndex.value == 3,
                    onTap: () => controller.setSelectedMenu(3),
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
