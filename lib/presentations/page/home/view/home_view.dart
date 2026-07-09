import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idehris/presentations/page/absen/view/absen_view.dart';
import '../controller/home_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../../home/widget/header profile/header_profile_widget.dart';
import '../../../page/home/widget/absensi card/absensi_card_widget.dart';
import '../widget/menu utama/menu_utama_widget.dart';
import '../../home/widget/jadwal harian/jadwal_hari_ini_widget.dart';
import '../widget/riwayat pengajuan/riwayat_pengajuan_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final profileController = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SafeArea(
        child: Column(
          children: [
            HeaderProfileWidget(
              controller: controller,
              profileController: profileController,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const AbsensiCardWidget(),
                    const MenuUtamaWidget(),
                    JadwalHariIniWidget(controller: controller),
                    RiwayatPengajuanWidget(controller: controller),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildBottomButton(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomButton(HomeController controller) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Obx(() {
        bool isMasuk = controller.isAbsenMasuk.value;
        String teksTombol = isMasuk ? "Absen Masuk" : "Absen Keluar";

        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // PERUBAHAN ADA DI BARIS INI
              Get.to(() => const AbsenView(), arguments: teksTombol);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isMasuk
                  ? const Color(0xFF1E3A8A)
                  : Colors.red.shade600,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  teksTombol,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  isMasuk ? Icons.login : Icons.logout,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
