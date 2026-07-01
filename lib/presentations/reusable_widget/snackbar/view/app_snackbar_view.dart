import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../reusable_widget/snackbar/controller/app_snackbar_controller.dart';

class AppSnackbarView extends StatelessWidget {
  final String title;
  final String message;
  final SnackbarType type;

  const AppSnackbarView({
    Key? key,
    required this.title,
    required this.message,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    IconData iconData;

    switch (type) {
      case SnackbarType.success:
        backgroundColor = Colors.green;
        iconData = Icons.check_circle;
        break;
      case SnackbarType.error:
        backgroundColor = Colors.red;
        iconData = Icons.error;
        break;
      case SnackbarType.info:
      default:
        backgroundColor = Colors.blue;
        iconData = Icons.info;
        break;
    }

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Icon(iconData, color: Colors.white),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(message, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
