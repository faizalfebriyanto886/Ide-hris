import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SnackbarType { success, error, info }

class AppSnackbar extends GetxController {
  void showSnackbar(String title, String message, SnackbarType type) {}
}
