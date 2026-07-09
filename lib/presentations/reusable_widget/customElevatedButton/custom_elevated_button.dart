import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color backgroundColor;
  final Color textColor;
  final double height; // Tambahan agar tinggi bisa diatur
  final double fontSize; // Tambahan agar ukuran font bisa disesuaikan

  const CustomElevatedButton({
    super.key,
    required this.label, // Wajib diisi menggunakan label: "Teks"
    required this.onTap,
    this.icon,
    this.backgroundColor = const Color(0xFF2D3E9F),
    this.textColor = Colors.white,
    this.height = 50.0,
    this.fontSize = 14.0,
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
          height: height, // <-- Ini yang bikin teks tidak terpotong lagi
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
              if (icon != null) ...[
                const SizedBox(width: 8),
                Icon(icon, color: textColor, size: fontSize + 4),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
