import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_page_controllers.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      backgroundColor: const Color(0xFFEDEDED),
      body: Stack(
        children: [
          Container(height: 260, color: const Color(0xFF1E4B8F)),

          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 110, left: 16, right: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              // PERBAIKAN: Tambahkan SingleChildScrollView di sini
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// LOGO
                    Image.asset("assets/images/Logo1.png", height: 50),

                    const SizedBox(height: 8),

                    /// CHIP TEXT
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

                    /// USERNAME
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Username *"),
                    ),
                    const SizedBox(height: 6),

                    TextField(
                      onChanged: controller.setUsername,
                      decoration: InputDecoration(
                        hintText: "Masukkan nama pengguna",
                        filled: true,
                        fillColor: const Color(0xFFF5F5F5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

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
                        decoration: InputDecoration(
                          hintText: "Masukkan password Anda",
                          filled: true,
                          fillColor: const Color(0xFFF5F5F5),
                          suffixIcon: IconButton(
                            // PERBAIKAN: Tombol mata sekarang memanggil fungsi yang benar
                            onPressed: controller.togglePassword,
                            icon: Icon(
                              controller.isObscure.value
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// LUPA PASSWORD
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          // Pastikan route '/forgot-password' sudah dibuat di GetMaterialApp
                          Get.toNamed('/forgot-password');
                        },
                        child: const Text(
                          "Lupa Kata Sandi?",
                          style: TextStyle(color: Colors.blue, fontSize: 12),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// BUTTON MASUK
                    Material(
                      color: const Color(0xFF2D3E9F),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: controller.login,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Masuk",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(Icons.check, color: Colors.white, size: 18),
                            ],
                          ),
                        ),
                      ),
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
