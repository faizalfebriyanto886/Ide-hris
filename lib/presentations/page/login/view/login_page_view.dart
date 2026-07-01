import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_page_controllers.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.53,
                color: const Color(0xFF194092),
              ),
              Expanded(child: Container(color: const Color(0xFFF3EEEE))),
            ],
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 7,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/images/Logo1.png', width: 100),

                      const SizedBox(height: 10),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "HR Information System on Apps",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Silahkan Masuk",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Pastikan anda masuk menggunakan akun yang sudah didaftarkan oleh admin",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),

                      const SizedBox(height: 20),

                      _label("Username"),
                      TextField(
                        controller: controller.usernameController,
                        decoration: _input("Masukkan nama pengguna"),
                      ),

                      const SizedBox(height: 15),

                      _label("Password"),
                      Obx(
                        () => TextField(
                          controller: controller.passwordController,
                          obscureText: controller.isObscure.value,
                          decoration: _input(
                            "Masukkan password Anda",
                            suffix: IconButton(
                              icon: Icon(
                                controller.isObscure.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: controller.togglePassword,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: controller.goToForgotPassword,
                          child: const Text(
                            "Lupa Kata Sandi?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : controller.login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E3192),
                              padding: const EdgeInsets.symmetric(vertical: 14),
                            ),
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : const Text("Masuk ✓"),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Divider(),

                      const Text(
                        "Belum punya akun? Hubungi Admin",
                        style: TextStyle(color: Colors.grey),
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

  Widget _label(String text) {
    return Align(alignment: Alignment.centerLeft, child: Text("$text *"));
  }

  InputDecoration _input(String hint, {Widget? suffix}) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      suffixIcon: suffix,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}
