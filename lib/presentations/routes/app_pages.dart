import 'package:get/get.dart';
import 'package:idehris/presentations/page/dashboard/controller/dashboard_controller.dart';
import 'package:idehris/presentations/page/dashboard/view/dashboard_view.dart';
import 'package:idehris/presentations/page/forgot%20password/controller/forgot_password_controller.dart';
import 'package:idehris/presentations/page/login/controller/login_page_controllers.dart';

import '../../presentations/page/login/view/login_page_view.dart';

import '../../presentations/page/forgot password/view/forgot_password_view.dart';

import 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: BindingsBuilder(() {
        Get.put(LoginController());
      }),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordPage(),
      binding: BindingsBuilder(() {
        Get.put(ForgotPasswordController());
      }),
    ),
    GetPage(
      name: '/dashboard',
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const DashboardView(),
      binding: BindingsBuilder(() {
        Get.put(DashboardController());
      }),
    ),
  ];
}
