import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;

class SuccessAbsenView extends StatelessWidget {
  const SuccessAbsenView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final String imagePath = args['imagePath'] ?? '';
    final String address = args['address'] ?? 'Lokasi tidak diketahui';
    final double lat = args['lat'] ?? 0.0;
    final double lng = args['lng'] ?? 0.0;
    final String date = args['date'] ?? 'Tanggal tidak diketahui';
    final String time = args['time'] ?? '00:00:00 WIB';
    final String jenisAbsen = args['jenisAbsen'] ?? 'Absen Masuk';

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6F8),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 320,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipPath(
                    clipper: HeaderClipper(),
                    child: Container(
                      height: 250,
                      width: double.infinity,
                      color: const Color(0xFF4A78D6), // Sesuaikan warna birunya
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Naisya Yuen Ra'af",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Frontend Developer",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),

                  Positioned(
                    top: 170,
                    child: Container(
                      padding: const EdgeInsets.all(
                        4,
                      ), // Memberikan bingkai putih
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey.shade300,
                        backgroundImage: imagePath.isNotEmpty
                            ? FileImage(File(imagePath))
                            : null,
                        child: imagePath.isEmpty
                            ? const Icon(
                                Icons.person,
                                size: 50,
                                color: Colors.grey,
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Mini Map (Mati, tidak bisa digeser)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 140,
                        width: double.infinity,
                        child: FlutterMap(
                          options: MapOptions(
                            initialCenter: ll.LatLng(lat, lng),
                            initialZoom: 16.5,
                            interactionOptions: const InteractionOptions(
                              flags: InteractiveFlag.none, // Mengunci peta
                            ),
                          ),
                          children: [
                            TileLayer(
                              urlTemplate:
                                  'https://basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png',
                              userAgentPackageName: 'com.naisya.idehris',
                            ),
                            CircleLayer(
                              circles: [
                                CircleMarker(
                                  point: ll.LatLng(lat, lng),
                                  color: const Color(
                                    0xFF1E3A8A,
                                  ).withOpacity(0.15),
                                  borderColor: const Color(
                                    0xFF1E3A8A,
                                  ).withOpacity(0.3),
                                  borderStrokeWidth: 1,
                                  useRadiusInMeter: true,
                                  radius: 50,
                                ),
                              ],
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: ll.LatLng(lat, lng),
                                  width: 16,
                                  height: 16,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1E3A8A),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Alamat Text
                    Text(
                      address,
                      style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      height: 32,
                      thickness: 1,
                      color: Color(0xFFF0F0F0),
                    ),
                    // Baris Data
                    _buildInfoRow("Tanggal", date),
                    const SizedBox(height: 12),
                    _buildInfoRow("Waktu $jenisAbsen", time),
                    const SizedBox(height: 12),
                    _buildInfoRow("Status", "Baik", isStatus: true),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.until((route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A78D6),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    "Kembali ke Beranda",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {bool isStatus = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: isStatus ? Colors.green.shade600 : Colors.black87,
            fontSize: 13,
            fontWeight: isStatus ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 50,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
