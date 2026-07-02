// ignore: implementation_imports
import 'package:flutter/src/foundation/basic_types.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var selectedIndex = 0.obs;

  ValueChanged<int>? get changeTabIndex => null;

  void setSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
