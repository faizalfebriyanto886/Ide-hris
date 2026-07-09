import 'package:geocoding/geocoding.dart' as geo;
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class AbsenController extends GetxController {
  var isLoading = true.obs;
  var currentLat = 0.0.obs;
  var currentLng = 0.0.obs;
  var currentAddress = "Mencari lokasi...".obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  // Fungsi untuk mendapatkan lokasi dan alamat
  Future<void> getCurrentLocation() async {
    isLoading.value = true;
    currentAddress.value = "Mencari lokasi...";

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      currentAddress.value = "GPS tidak aktif";
      isLoading.value = false;
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        currentAddress.value = "Izin lokasi ditolak";
        isLoading.value = false;
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      currentAddress.value = "Izin lokasi ditolak permanen";
      isLoading.value = false;
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    currentLat.value = position.latitude;
    currentLng.value = position.longitude;

    try {
      List<geo.Placemark> placemarks = await geo.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        geo.Placemark place = placemarks[0];
        currentAddress.value =
            "${place.street}, ${place.subLocality}, ${place.locality}, ${place.administrativeArea}";
      }
    } catch (e) {
      currentAddress.value = "Gagal memuat alamat lengkap";
    }

    isLoading.value = false;
  }
}
