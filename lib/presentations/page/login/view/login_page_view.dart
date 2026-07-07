import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_page_controllers.dart';
import '../../../reusable_widget/customElevatedButton/custom_elevated_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: Stack(
        children: [
          Container(height: 450, color: const Color(0xFF1E4B8F)),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 110, left: 16, right: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/images/Logo1.png", height: 50),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE6E9F5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "HR Information System on Apps",
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF2D3E9F),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Silahkan Masuk",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Pastikan anda masuk menggunakan akun yang sudah didaftarkan oleh admin",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),

                    const SizedBox(height: 20),

                    /// EMAIL FIELD
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Email *"),
                    ),
                    const SizedBox(height: 6),
                    TextField(
                      onChanged: controller.setEmail,
                      decoration: InputDecoration(
                        hintText: "Masukkan email Anda",
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    /// PASSWORD FIELD
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Password *"),
                    ),
                    const SizedBox(height: 6),
                    Obx(
                      () => TextField(
                        obscureText: controller.isObscure.value,
                        onChanged: controller.setPassword,
                        decoration: InputDecoration(
                          hintText: "Masukkan password Anda",
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            onPressed: controller.togglePassword,
                            icon: Icon(
                              controller.isObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// LUPA KATA SANDI
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () => Get.toNamed('/forgot-password'),
                        child: const Text(
                          "Lupa Kata Sandi?",
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// BUTTON MASUK
                    CustomElevatedButton(
                      label: "Masuk",
                      icon: Icons.done,
                      onTap: controller.login,
                      // onTap: () {
                      //   Get.toNamed('/dashboard');
                      // },
                    ),

                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 8),
                    const Text(
                      "Belum punya akun? Hubungi Admin",
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
