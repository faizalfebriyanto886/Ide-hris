import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';
import '../controller/camera_absen_controller.dart';

class CameraAbsenView extends StatelessWidget {
  const CameraAbsenView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CameraAbsenController());
    final String jenisAbsen = Get.arguments ?? "Absen Masuk";

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Obx(() {
          if (!controller.isInitialized.value) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          }

          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: controller.imageFile.value == null
                    ? CameraPreview(controller.cameraController!)
                    : Image.file(
                        File(controller.imageFile.value!.path),
                        fit: BoxFit.cover,
                      ),
              ),

              Positioned(
                top: 16,
                left: 16,
                child: Text(
                  "$jenisAbsen - Camera",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    shadows: [Shadow(color: Colors.black54, blurRadius: 4)],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: controller.imageFile.value == null
                    ? _buildCameraControls(controller)
                    : _buildApproveControls(controller),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildCameraControls(CameraAbsenController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Colors.black.withOpacity(0.8), Colors.transparent],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.cancel_outlined,
              color: Colors.white,
              size: 36,
            ),
          ),
          GestureDetector(
            onTap: () => controller.takePicture(),
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: const Color(0xFF283593), // Biru gelap sesuai gambar
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => controller.switchCamera(),
            child: const Icon(
              Icons.flip_camera_ios,
              color: Colors.white,
              size: 36,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildApproveControls(CameraAbsenController controller) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () => controller.retakePicture(),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: const BorderSide(color: Colors.grey),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Ulangi",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.autorenew, color: Colors.black87, size: 18),
                ],
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: ElevatedButton(
              onPressed: () => controller.simpanAbsen(),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF283593),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Simpan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.check_circle, color: Colors.white, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
