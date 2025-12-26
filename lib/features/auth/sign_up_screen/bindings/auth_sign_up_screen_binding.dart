import 'package:get/get.dart';

import '../controllers/auth_sign_up_screen_controller.dart';

class AuthSignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthSignUpScreenController>(
      () => AuthSignUpScreenController(),
    );
  }
}
