import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../reusable_widget/snackbar/app_snackbar.dart';
import '../../../routes/app_routes.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  var isObscure = true.obs;
  var isLoading = false.obs;

  void setUsername(String value) {
    usernameController.text = value;
  }

  void setPassword(String value) {
    passwordController.text = value;
  }

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
      AppSnackbar.error("Error", "Username dan password wajib diisi");
      return;
    }

    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;

    AppSnackbar.success("Success", "Login berhasil");
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
