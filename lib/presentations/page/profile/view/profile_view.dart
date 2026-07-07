import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';
import 'package:idehris/presentations/page/profile/view/edit_profile_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 24,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 45,
                      backgroundColor: Color(0xFFE6E9F5),
                      child: Icon(Icons.person, size: 50, color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => Text(
                        controller.userName.value,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Obx(
                      () => Text(
                        controller.userRole.value,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF2D3E9F)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Obx(
                        () => Text(
                          "Bergabung Sejak ${controller.joinYear.value}",
                          style: const TextStyle(
                            color: Color(0xFF2D3E9F),
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        _buildCutiCard(
                          "Kuota Cuti",
                          Icons.assignment_ind_outlined,
                          controller.kuotaCuti,
                        ),
                        const SizedBox(width: 8),
                        _buildCutiCard(
                          "Cuti Terpakai",
                          Icons.wb_sunny_outlined,
                          controller.cutiTerpakai,
                        ),
                        const SizedBox(width: 8),
                        _buildCutiCard(
                          "Sisa Cuti",
                          Icons.bookmark_border,
                          controller.sisaCuti,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Container(
                color: Colors.white,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "PENGATURAN",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildSettingMenu(Icons.person_outline, "Data Diri", () {
                      Get.to(() => const EditProfileView());
                    }),
                    _buildSettingMenu(
                      Icons.notifications_none,
                      "Pengaturan Notifikasi",
                      () {},
                    ),
                    _buildSettingMenu(
                      Icons.lock_outline,
                      "Kebijakan Privasi",
                      () {},
                    ),
                    _buildSettingMenu(
                      Icons.article_outlined,
                      "Syarat & Ketentuan",
                      () {},
                    ),
                    _buildSettingMenu(
                      Icons.support_agent,
                      "Pusat Bantuan",
                      () {},
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.logout,
                        color: Color(0xFF2D3E9F),
                      ),
                      title: const Text(
                        "Keluar",
                        style: TextStyle(fontSize: 14),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.grey,
                      ),
                      onTap: controller.confirmLogout,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                "@2026 Powered By Enigma Technology",
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCutiCard(String title, IconData icon, RxString value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, size: 14, color: const Color(0xFF2D3E9F)),
                const SizedBox(width: 4),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Obx(
              () => Text(
                value.value,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingMenu(IconData icon, String title, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Icon(icon, color: const Color(0xFF2D3E9F)),
          title: Text(title, style: const TextStyle(fontSize: 14)),
          trailing: const Icon(Icons.chevron_right, color: Colors.grey),
          onTap: onTap,
        ),
        Divider(color: Colors.grey.shade200, height: 1),
      ],
    );
  }
}
