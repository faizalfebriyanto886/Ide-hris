import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentDate = ''.obs;
  var currentTime = ''.obs;

  var isAbsenMasuk = true.obs;

  Timer? _timer;

  GestureTapCallback? get absenKeluar => null;

  GestureTapCallback? get absenMasuk => null;

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
  }

  void toggleAbsen() {
    isAbsenMasuk.value = !isAbsenMasuk.value;

    Get.snackbar(
      "Berhasil",
      isAbsenMasuk.value ? "Anda telah Absen Keluar" : "Anda telah Absen Masuk",
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
