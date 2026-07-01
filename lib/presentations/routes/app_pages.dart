import 'package:get/get.dart';

import '../../presentations/page/login/view/login_page_view.dart';
import '../../presentations/page/login/binding/login_binding.dart';

import '../../presentations/page/forgot password/view/forgot_password_view.dart';
import '../../presentations/page/forgot password/binding/forgot_password_binding.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
  ];
}
