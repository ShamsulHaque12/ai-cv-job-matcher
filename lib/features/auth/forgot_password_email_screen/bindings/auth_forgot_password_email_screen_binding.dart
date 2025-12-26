import 'package:get/get.dart';

import '../controllers/auth_forgot_password_email_screen_controller.dart';

class AuthForgotPasswordEmailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthForgotPasswordEmailScreenController>(
      () => AuthForgotPasswordEmailScreenController(),
    );
  }
}
