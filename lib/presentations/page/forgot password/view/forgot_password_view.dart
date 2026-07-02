import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// BACKGROUND
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
            child: Column(
              children: [
                const SizedBox(height: 40),

                /// LOGO
                Image.asset('assets/images/Logo1.png', height: 60),

                const SizedBox(height: 20),

                /// HR BOX
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "HR Information System",
                    style: TextStyle(
                      color: Color(0xFF0D47A1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                /// CARD
                Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// BACK BUTTON
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.arrow_back),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Lupa Kata Sandi",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        const Text(
                          "Masukkan email untuk reset password",
                          style: TextStyle(color: Colors.grey),
                        ),

                        const SizedBox(height: 20),

                        /// EMAIL
                        TextField(
                          onChanged: controller.setEmail,
                          decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        /// SUBMIT BUTTON
                        Material(
                          color: const Color(0xFF2F3A8F),
                          borderRadius: BorderRadius.circular(16),
                          child: InkWell(
                            onTap: controller.submit, // Panggil fungsi submit
                            borderRadius: BorderRadius.circular(16),
                            child: Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              child: const Text(
                                "Kirim",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
