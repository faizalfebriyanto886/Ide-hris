import 'dart:ui';

import 'package:get/get.dart';
import '../../../reusable_widget/snackbar/app_snackbar.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;

  get AppSnackbar => null;

  VoidCallback? get submitForgotPassword => null;

  void setEmail(String value) {
    email.value = value;
  }

  void submit() {
    if (email.value.isEmpty) {
      AppSnackbar.error("Error", "Email wajib diisi");
      return;
    }

    AppSnackbar.success("Berhasil", "Link reset dikirim ke ${email.value}");

    Get.back(); // balik ke login
  }
}
