import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentDate = ''.obs;
  var currentTime = ''.obs;
  var greeting = ''.obs;

  var isAbsenMasuk = true.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _updateDateTime();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateDateTime();
    });
  }

  void _updateDateTime() {
    final now = DateTime.now();
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Ags',
      'Sep',
      'Okt',
      'Nov',
      'Des',
    ];

    String day = now.day.toString().padLeft(2, '0');
    String month = months[now.month - 1];
    String year = now.year.toString();
    currentDate.value = "$day $month $year";

    String hour = now.hour.toString().padLeft(2, '0');
    String minute = now.minute.toString().padLeft(2, '0');
    String second = now.second.toString().padLeft(2, '0');
    currentTime.value = "$hour:$minute:$second WIB";

    if (now.hour >= 0 && now.hour < 11) {
      greeting.value = "Selamat Pagi,";
    } else if (now.hour >= 11 && now.hour < 15) {
      greeting.value = "Selamat Siang,";
    } else if (now.hour >= 15 && now.hour < 18) {
      greeting.value = "Selamat Sore,";
    } else {
      greeting.value = "Selamat Malam,";
    }
  }

  void toggleAbsen() {
    isAbsenMasuk.value = !isAbsenMasuk.value;

    Get.snackbar(
      "Berhasil",
      isAbsenMasuk.value
          ? "Anda telah batal dan kembali ke Absen Masuk"
          : "Anda telah Absen Keluar",
      backgroundColor: isAbsenMasuk.value ? Colors.blue : Colors.red.shade600,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
