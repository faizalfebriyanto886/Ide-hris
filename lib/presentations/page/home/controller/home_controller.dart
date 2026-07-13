import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentDate = ''.obs;
  var currentTime = ''.obs;
  var greeting = ''.obs;
  var isAbsenMasuk = true.obs;
  var jamAbsenMasuk = "--:-- WIB".obs;
  var jamAbsenKeluar = "--:-- WIB".obs;

  Timer? _timer;

  var listJadwalHariIni = <JadwalHariIniModel>[
    JadwalHariIniModel(
      namaJadwal: "Rapat Harian SDM Untuk Persiapan Harpitnas Pe...",
      lokasiMeet: "Zoom Meeting",
      waktuMeet: "09:00 - 12:00 WIB",
      borderColor: const Color(0xFF2D3E9F),
    ),
    JadwalHariIniModel(
      namaJadwal: "Sosialisasi Pemutakhiran Fitur Website POS",
      lokasiMeet: "Aula Gatotkaca Mahabaratha 1",
      waktuMeet: "09:00 - 12:00 WIB",
      borderColor: Colors.green,
    ),
    JadwalHariIniModel(
      namaJadwal: "Rapat Harian SDM",
      lokasiMeet: "Gedung Serbaguna Burningroom...",
      waktuMeet: "09:00 - 12:00 WIB",
      borderColor: Colors.orange, // Oranye
    ),
  ].obs;

  var listRiwayatPengajuan = <RiwayatPengajuanModel>[
    RiwayatPengajuanModel(
      namaPengajuan: "Cuti Pernikahan",
      waktuPengajuan: "22 Jan 2020, 09:00 WIB",
      status: "Menunggu",
      colorPrefix: const Color(0xFF2D3E9F), // Biru
    ),
    RiwayatPengajuanModel(
      namaPengajuan: "Izin Setengah Hari",
      waktuPengajuan: "20 Jan 2020, 09:00 WIB",
      status: "Menunggu",
      colorPrefix: Colors.orange, // Oranye
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    _updateDateTime();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) => _updateDateTime(),
    );
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

    currentDate.value =
        "${now.day.toString().padLeft(2, '0')} ${months[now.month - 1]} ${now.year}";
    currentTime.value =
        "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')} WIB";

    if (now.hour < 11) {
      greeting.value = "Selamat Pagi,";
    } else if (now.hour < 15)
      // ignore: curly_braces_in_flow_control_structures
      greeting.value = "Selamat Siang,";
    else if (now.hour < 18)
      // ignore: curly_braces_in_flow_control_structures
      greeting.value = "Selamat Sore,";
    else
      // ignore: curly_braces_in_flow_control_structures
      greeting.value = "Selamat Malam,";
  }

  void toggleAbsen() {
    isAbsenMasuk.value = !isAbsenMasuk.value;
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}

class JadwalHariIniModel {
  final String? namaJadwal;
  final String? lokasiMeet;
  final String? waktuMeet;
  final Color? borderColor;

  JadwalHariIniModel({
    this.namaJadwal,
    this.lokasiMeet,
    this.waktuMeet,
    this.borderColor,
  });
}

class RiwayatPengajuanModel {
  final String? namaPengajuan;
  final String? waktuPengajuan;
  final String? status;
  final Color? colorPrefix;

  RiwayatPengajuanModel({
    this.namaPengajuan,
    this.waktuPengajuan,
    this.status,
    this.colorPrefix,
  });
}
