import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;

  const CustomElevatedButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.backgroundColor = const Color(0xFF2D3E9F),
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
              ),
              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon, color: textColor, size: 18),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
