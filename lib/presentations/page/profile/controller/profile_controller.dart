import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../reusable_widget/customElevatedButton/custom_elevated_button.dart';

class ProfileController extends GetxController {
  var userName = "Naisya Yuen Ra'af".obs;
  var userRole = "Magang".obs;
  var joinYear = "2026".obs;

  var kuotaCuti = "-".obs;
  var cutiTerpakai = "-".obs;
  var sisaCuti = "-".obs;

  void changeProfilePicture() {
    Get.snackbar(
      "Ubah Foto",
      "Fitur akses galeri akan segera diimplementasikan.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void confirmLogout() {
    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          "Konfirmasi Keluar",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        content: const Text(
          "Apakah Anda yakin ingin logout dari aplikasi?",
          style: TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text(
              "Batal",
              style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
            ),
          ),

          SizedBox(
            width: 120,
            child: CustomElevatedButton(
              label: "Ya, Keluar",
              onTap: () {
                Get.offAllNamed('/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
