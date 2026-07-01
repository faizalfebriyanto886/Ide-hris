import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isObscure = true.obs;
  var isLoading = false.obs;

  ValueChanged<String>? get setEmail => null;

  ValueChanged<String>? get setPassword => null;

  ValueChanged<String>? get setUsername => null;

  GestureTapCallback? get forgotPassword => null;

  void togglePassword() {
    isObscure.value = !isObscure.value;
  }

  void goToForgotPassword() {
    Get.toNamed(Routes.FORGOT_PASSWORD);
  }

  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Username dan password wajib diisi");
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;

    Get.snackbar("Success", "Login berhasil (dummy)");
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
