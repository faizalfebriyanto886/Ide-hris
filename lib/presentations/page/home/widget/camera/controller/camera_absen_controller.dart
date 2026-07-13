import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:idehris/presentations/page/absen/controller/absen_controller.dart';
import 'package:idehris/presentations/page/home/controller/home_controller.dart';
import 'package:idehris/presentations/page/home/widget/success%20absen/success_absen_view.dart';

class CameraAbsenController extends GetxController {
  CameraController? cameraController;
  List<CameraDescription>? cameras;

  var isInitialized = false.obs;
  var isFrontCamera = true.obs; // untuk selfie
  var imageFile = Rx<XFile?>(null); // simpan hasil foto

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }

  Future<void> initCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      int cameraIndex = isFrontCamera.value ? 1 : 0;
      if (cameras!.length < 2) cameraIndex = 0;

      cameraController = CameraController(
        cameras![cameraIndex],
        ResolutionPreset.high,
        enableAudio: false,
      );

      await cameraController!.initialize();
      isInitialized.value = true;
    }
  }

  void switchCamera() async {
    if (cameras == null || cameras!.length < 2) return;

    isInitialized.value = false;
    isFrontCamera.value = !isFrontCamera.value;
    await initCamera();
  }

  Future<void> takePicture() async {
    if (!cameraController!.value.isInitialized) return;
    if (cameraController!.value.isTakingPicture) return;

    try {
      XFile picture = await cameraController!.takePicture();
      imageFile.value = picture;
    } catch (e) {
      Get.snackbar("Error", "Gagal mengambil foto: $e");
    }
  }

  void retakePicture() {
    imageFile.value = null; //delete foto nd back to live preview
  }

  void simpanAbsen() {
    final homeController = Get.find<HomeController>();
    final absenController = Get.find<AbsenController>();
    final String jenisAbsen = Get.arguments ?? "Absen Masuk";

    String waktuKunci = homeController.currentTime.value;
    String tanggalKunci = homeController.currentDate.value;

    if (jenisAbsen == "Absen Masuk") {
      homeController.jamAbsenMasuk.value = waktuKunci;
    } else {
      homeController.jamAbsenKeluar.value = waktuKunci;
    }

    homeController.toggleAbsen();

    Get.off(
      () => const SuccessAbsenView(),
      arguments: {
        'imagePath': imageFile.value!.path,
        'address': absenController.currentAddress.value,
        'lat': absenController.currentLat.value,
        'lng': absenController.currentLng.value,
        'date': tanggalKunci,
        'time': waktuKunci,
        'jenisAbsen': jenisAbsen,
      },
    );
  }
}
