import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idehris/presentations/page/dashboard/view/dashboard_view.dart';
import '../../page/home/view/home_view.dart';

class MainBarController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> menuPages = [
    const HomeView(),
    const Center(child: Text("Ini Halaman Obrolan")),
    const Center(child: Text("Ini Halaman Notifikasi")),
    const Center(child: Text("Ini Halaman Profil")),
  ];

  void setSelectedMenu(int index) {
    selectedIndex.value = index;
  }
}
