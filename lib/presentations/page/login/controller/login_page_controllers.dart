import 'package:flutter/material.dart';

class LoginController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final ValueNotifier<bool> isObscure = ValueNotifier<bool>(true);
  final ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void togglePassword() {
    isObscure.value = !isObscure.value;
  }

  Future<void> login(BuildContext context) async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username and password cannot be empty')),
      );
      return;
    }

    if (isLoading.value) return;
    isLoading.value = true;

    // Placeholder login logic. Replace with real authentication.
    await Future.delayed(const Duration(seconds: 1));

    isLoading.value = false;
  }

  final ValueNotifier<bool> isLoggedIn = ValueNotifier<bool>(false);
  final ValueNotifier<String> errorMessage = ValueNotifier<String>('');

  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    isLoading.dispose();
    isObscure.dispose();
  }
}
