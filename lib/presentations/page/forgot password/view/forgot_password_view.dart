import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Forgot Password")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              onChanged: controller.setEmail,
              decoration: const InputDecoration(hintText: "Email"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.submit,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
