import 'package:get/get.dart';

import '../controllers/sign_up_option_controller.dart';

class SignUpOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpOptionController>(
      () => SignUpOptionController(),
    );
  }
}
