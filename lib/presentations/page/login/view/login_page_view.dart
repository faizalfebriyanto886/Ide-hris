import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idehris/presentations/reusable_widget/button/app_button.dart';
import '../controller/login_page_controllers.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  InputDecoration inputStyle(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(fontSize: 13, color: Colors.grey),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// background
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(color: const Color(0xFF0D47A1)),
              ),
              Expanded(flex: 3, child: Container(color: Colors.white)),
            ],
          ),

          /// CONTENT
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F6F8),
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      /// LOGO
                      Image.asset('assets/images/Logo1.png', height: 40),

                      const SizedBox(height: 8),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD6E4FF),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "HR Information System on Apps",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF1E40AF),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// TITLE
                      const Text(
                        "Silahkan Masuk",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 6),

                      const Text(
                        "Pastikan anda masuk menggunakan akun yang sudah\n"
                        "didaftarkan oleh admin",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),

                      const SizedBox(height: 20),

                      /// username
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Username *"),
                      ),
                      const SizedBox(height: 6),

                      TextField(
                        onChanged: controller.setUsername,
                        decoration: inputStyle("Masukkan nama pengguna"),
                      ),

                      const SizedBox(height: 14),

                      /// PASSWORD
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Password *"),
                      ),
                      const SizedBox(height: 6),

                      Obx(
                        () => TextField(
                          obscureText: controller.isObscure.value,
                          onChanged: controller.setPassword,
                          decoration: inputStyle("Masukkan password Anda")
                              .copyWith(
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isObscure.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 18,
                                  ),
                                  onPressed: controller.togglePassword,
                                ),
                              ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      /// FORGOT PASSWORD
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: controller.goToForgotPassword,
                          child: const Text(
                            "Lupa Kata Sandi?",
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF1E40AF),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// BUTTON
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: controller.login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2F3A8F),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: const Text("Masuk"),
                        ),
                      ),

                      const SizedBox(height: 18),

                      const Text(
                        "Belum punya akun? Hubungi Admin",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
