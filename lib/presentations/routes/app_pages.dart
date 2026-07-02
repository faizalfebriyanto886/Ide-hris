import 'package:get/get.dart';
import 'package:idehris/presentations/page/forgot%20password/controller/forgot_password_controller.dart';
import 'package:idehris/presentations/page/login/controller/login_page_controllers.dart';

import '../../presentations/page/login/view/login_page_view.dart';
import '../../presentations/page/login/binding/login_binding.dart';

import '../../presentations/page/forgot password/view/forgot_password_view.dart';
import '../../presentations/page/forgot password/binding/forgot_password_binding.dart';

import 'app_routes.dart';

import 'package:get/get.dart';

class AppPages {
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
  ];
}
