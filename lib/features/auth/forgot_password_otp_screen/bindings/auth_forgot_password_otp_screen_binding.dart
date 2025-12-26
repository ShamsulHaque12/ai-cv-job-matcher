import 'package:get/get.dart';

import '../controllers/auth_forgot_password_otp_screen_controller.dart';

class AuthForgotPasswordOtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthForgotPasswordOtpScreenController>(
      () => AuthForgotPasswordOtpScreenController(),
    );
  }
}
