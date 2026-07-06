import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      appBar: AppBar(
        title: const Text(
          "Halaman Utama",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.home_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    "Ini Halaman Utama",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),

          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
              bottom: 12,
            ),
            child: Obx(() {
              bool isMasuk = controller.isAbsenMasuk.value;
              return Material(
                color: isMasuk ? const Color(0xFF2D3E9F) : Colors.red.shade600,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: controller.toggleAbsen,
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          isMasuk ? "Absen Masuk" : "Absen Keluar",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
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
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
