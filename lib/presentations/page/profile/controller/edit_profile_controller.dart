import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  late TextEditingController namaController;
  late TextEditingController tanggalLahirController;
  late TextEditingController jenisKelaminController;
  late TextEditingController alamatController;
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void onInit() {
    super.onInit();
    namaController = TextEditingController(text: "Naisya Yuen Ra'af");
    tanggalLahirController = TextEditingController(text: "09 Feb 2006");
    jenisKelaminController = TextEditingController(text: "Perempuan");
    alamatController = TextEditingController(
      text: "Jl. Ruko Sunpride 321, Nginden Jangkungan,\nSurabaya",
    );
    usernameController = TextEditingController(text: "itsyuenai");
    passwordController = TextEditingController(text: "********");
  }

  @override
  void onClose() {
    namaController.dispose();
    tanggalLahirController.dispose();
    jenisKelaminController.dispose();
    alamatController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void changeProfilePicture() {
    Get.snackbar(
      "Ubah Foto",
      "Fitur akses galeri akan segera diimplementasikan.",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void ubahData() {
    Get.snackbar(
      "Berhasil",
      "Data profil berhasil diperbarui",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
    });
  }
}
