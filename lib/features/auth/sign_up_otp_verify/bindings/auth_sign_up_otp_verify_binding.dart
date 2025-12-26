import 'package:get/get.dart';

import '../controllers/auth_sign_up_otp_verify_controller.dart';

class AuthSignUpOtpVerifyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthSignUpOtpVerifyController>(
      () => AuthSignUpOtpVerifyController(),
    );
  }
}
