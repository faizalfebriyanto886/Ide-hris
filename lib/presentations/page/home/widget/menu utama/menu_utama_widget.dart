import 'package:flutter/material.dart';
import '../menu item/menu_item_widget.dart';

class MenuUtamaWidget extends StatelessWidget {
  const MenuUtamaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listMenu = [
      {"icon": Icons.access_time, "label": "Kehadiran"},
      {"icon": Icons.edit_document, "label": "Pengajuan"},
      {"icon": Icons.account_balance_wallet_outlined, "label": "Slip Gaji"},
      {"icon": Icons.calendar_month, "label": "Kalender"},
      {"icon": Icons.view_agenda_outlined, "label": "Agenda"},
      {"icon": Icons.campaign_outlined, "label": "Pengumuman"},
      {"icon": Icons.warning_amber_rounded, "label": "Peringatan"},
      {"icon": Icons.book_outlined, "label": "Logbook"},
    ];

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Menu Utama",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          const SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            childAspectRatio: 0.9,
            children: listMenu
                .map(
                  (menu) => MenuItemWidget(
                    icon: menu["icon"],
                    label: menu["label"],
                    onTap: () {},
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
