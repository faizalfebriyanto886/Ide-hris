import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/home_controller.dart';
import '../../../profile/controller/profile_controller.dart';
import '../../../profile/view/profile_view.dart';

class HeaderProfileWidget extends StatelessWidget {
  final HomeController controller;
  final ProfileController profileController;

  const HeaderProfileWidget({
    super.key,
    required this.controller,
    required this.profileController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: Colors.white,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => const ProfileView()),
            child: const CircleAvatar(
              radius: 22,
              backgroundColor: Color(0xFFE6E9F5),
              child: Icon(Icons.person, size: 28, color: Colors.grey),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(
                  () => Text(
                    controller.greeting.value,
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ),
                Obx(
                  () => Text(
                    profileController.userName.value,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                  controller.currentDate.value,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Obx(
                () => Text(
                  controller.currentTime.value,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
