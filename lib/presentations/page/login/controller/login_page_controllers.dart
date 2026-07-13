import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  //fungsi menjadi async
  void login() async {
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan password wajib diisi',
        backgroundColor: Colors.orange,
        colorText: Colors.white,
      );
      return;
    }

    if (email != 'user@gmail.com') {
      Get.snackbar(
        'Error',
        'Email tidak cocok',
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

    // --- 3. SIMPAN SESI LOGIN DI SINI ---
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    // ------------------------------------

    Get.snackbar(
      'Sukses',
      'Login berhasil',
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );

    Get.offAllNamed('/dashboard');
  }
}
