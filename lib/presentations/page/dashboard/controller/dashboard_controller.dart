import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;
  var isAbsenMasuk = true.obs;

  void toggleAbsen() {
    isAbsenMasuk.value = !isAbsenMasuk.value;
    Get.snackbar(
      "Absen Masuk Berhasil",
      isAbsenMasuk.value
          ? "Anda telah melakukan absen masuk"
          : "Anda telah melakukan absen keluar",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }
}
