import 'package:get/get.dart';
import '../../../reusable_widget/snackbar/app_snackbar.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;

  void setEmail(String value) {
    email.value = value;
  }

  void submit() {
    // 1. Cek apakah email kosong
    if (email.value.isEmpty) {
      AppSnackbar.error("Error", "Email wajib diisi");
      return;
    }

    // 2. Cek apakah format email valid (otomatis mengecek ada @ dan domainnya)
    if (!GetUtils.isEmail(email.value)) {
      AppSnackbar.error("Error", "Format email tidak valid");
      return;
    }

    // Jika lolos validasi, tampilkan pesan sukses
    AppSnackbar.success("Berhasil", "Link reset dikirim ke ${email.value}");

    // 3. Kasih jeda 1.5 detik agar pop up terbaca, lalu kembali ke halaman login
    Future.delayed(const Duration(milliseconds: 1500), () {
      // Get.back();
      Get.offAllNamed('/login');
    });
  }
}
