import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  String email = '';
  String password = '';

  final isObscure = true.obs;

  void setEmail(String value) {
    email = value;
  }

  void setPassword(String value) {
    password = value;
  }

  void togglePassword() {
    isObscure.value = !isObscure.value;
  }

  void login() {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan password wajib diisi',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    if (email != 'user@example.com') {
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
    Get.offAllNamed('/dashboard');
  }
}
