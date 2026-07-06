import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idehris/presentations/page/chat/view/chat_view.dart';
import 'package:idehris/presentations/page/dashboard/view/dashboard_view.dart';
import 'package:idehris/presentations/page/notification/view/notification_view.dart';
import 'package:idehris/presentations/page/profile/view/profile_view.dart';
import '../../page/home/view/home_view.dart';

class MainBarController extends GetxController {
  var selectedIndex = 0.obs;

  final List<Widget> menuPages = [
    const HomeView(),
    const ChatView(),
    const NotificationView(),
    const ProfileView(),
  ];

  void setSelectedMenu(int index) {
    selectedIndex.value = index;
  }
}
