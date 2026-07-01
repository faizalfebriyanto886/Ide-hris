import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void submit() {
    if (email.value.isEmpty) {
      Get.snackbar("Error", "Email wajib diisi");
      return;
    }

    Get.snackbar("Success", "Link reset dikirim ke ${email.value}");
  }
}
