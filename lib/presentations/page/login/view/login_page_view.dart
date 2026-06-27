import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../controller/login_page_controllers.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  get child => null;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.53,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 25, 64, 146),
                ),
              ),
              Expanded(
                child: Container(
                  color: const Color.fromARGB(255, 243, 238, 238),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/Logo1.png',
                            width: 100,
                            height: 50,
                          ),
                          // ImagePicture.asset(
                          //   'assets/images/Logo1.png',
                          //   width: 100,
                          //   height: 50,
                          // ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 10,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(41, 136, 166, 230),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              "HR Information System on Apps",
                              style: TextStyle(
                                fontSize: 12,
                                color: Color.fromARGB(255, 85, 0, 222),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Silahkan Masuk",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      const Text(
                        "Pastikan anda masuk menggunakan akun yang sudah didaftarkan oleh admin",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color.fromARGB(255, 121, 119, 119),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Username
                      _label("Username"),
                      const SizedBox(height: 6),
                      TextField(
                        controller: controller.usernameController,
                        decoration: _inputDecoration("Masukkan nama pengguna"),
                      ),

                      const SizedBox(height: 15),

                      // Password
                      _label("Password"),
                      const SizedBox(height: 6),

                      ValueListenableBuilder(
                        valueListenable: controller.isObscure,
                        builder: (context, value, _) {
                          return TextField(
                            controller: controller.passwordController,
                            obscureText: value,
                            decoration: _inputDecoration(
                              "Masukkan password Anda",
                              suffix: IconButton(
                                icon: Icon(
                                  value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: controller.togglePassword,
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Lupa Kata Sandi?",
                          style: TextStyle(
                            color: Colors.blue[700],
                            fontSize: 12,
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      // Button
                      ValueListenableBuilder(
                        valueListenable: controller.isLoading,
                        builder: (context, loading, _) {
                          return SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: loading
                                  ? null
                                  : () => controller.login(context),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF2E3192),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: loading
                                  ? const SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text(
                                      "Masuk ✓",
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 15),

                      const Divider(),

                      const SizedBox(height: 8),

                      const Text(
                        "Belum punya akun? Hubungi Admin",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
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
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: "$text ",
          style: const TextStyle(color: Colors.black),
          children: const [
            TextSpan(
              text: "*",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint, {Widget? suffix}) {
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
