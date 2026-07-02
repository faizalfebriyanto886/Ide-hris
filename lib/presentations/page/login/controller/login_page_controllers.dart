import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  String username = '';
  String password = '';

  final isObscure = true.obs;

  void setUsername(String value) {
    username = value;
  }

  void setPassword(String value) {
    password = value;
  }

  // Fungsi ini sekarang bekerja untuk tombol mata di password
  void togglePassword() {
    isObscure.value = !isObscure.value;
  }

  void login() {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Username dan password wajib diisi',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    if (username != 'user') {
      Get.snackbar(
        'Error',
        'Username tidak cocok',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (password != 'password') {
      Get.snackbar(
        'Error',
        'Password salah',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    Get.snackbar(
      'Sukses',
      'Login berhasil',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
    // Get.offAllNamed('/home');
  }
}
