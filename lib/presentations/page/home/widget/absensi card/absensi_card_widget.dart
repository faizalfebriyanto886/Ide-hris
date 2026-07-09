import 'package:flutter/material.dart';

class AbsensiCardWidget extends StatelessWidget {
  const AbsensiCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8F9FE),
          border: Border.all(color: const Color(0xFF1E3A8A).withOpacity(0.4)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            const Text(
              "Absensi Hari Ini",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Color(0xFF1E3A8A),
              ),
            ),
            const SizedBox(height: 2),
            const Text(
              "Reguler Shift (08:00 - 17:00)",
              style: TextStyle(color: Colors.grey, fontSize: 10),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAbsenInfo("08:10:00", "Absen Masuk"),
                _buildAbsenInfo("00:00:00", "Absen Keluar"),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: List.generate(
                40,
                (index) => Expanded(
                  child: Container(
                    // color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade400,
                    // height: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Ingin Mengajukan Izin ? ",
                  style: TextStyle(
                    color: Color(0xFF1E3A8A),
                    fontSize: 11,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                SizedBox(
                  height: 28,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E3A8A),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Klik Disini",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbsenInfo(String time, String label) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 18,
          backgroundColor: Color(0xFFE6E9F5),
          child: Icon(Icons.person, size: 22, color: Colors.grey),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              time,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 10),
            ),
          ],
        ),
      ],
    );
  }
}
