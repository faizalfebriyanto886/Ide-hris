import 'package:flutter/material.dart';

class CustomNavBarItem extends StatelessWidget {
  final IconData icon;
  final IconData iconDisabled;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const CustomNavBarItem({
    super.key,
    required this.icon,
    required this.iconDisabled,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // 2. UBAH DI SINI: Image.asset diganti jadi Icon
          Icon(
            selected ? icon : iconDisabled,
            size: selected ? 26 : 24,
            color: selected ? const Color(0xFF2D3E9F) : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: selected ? const Color(0xFF2D3E9F) : Colors.grey,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: 3,
            width: 35,
            decoration: BoxDecoration(
              color: selected ? const Color(0xFF2D3E9F) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ],
      ),
    );
  }
}
