import 'package:get/get.dart';

import '../controllers/auth_forgot_password_screen_controller.dart';

class AuthForgotPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthForgotPasswordScreenController>(
      () => AuthForgotPasswordScreenController(),
    );
  }
}
