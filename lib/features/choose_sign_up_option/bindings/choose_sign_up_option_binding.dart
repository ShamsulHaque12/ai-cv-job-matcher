import 'package:get/get.dart';

import '../controllers/choose_sign_up_option_controller.dart';

class ChooseSignUpOptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseSignUpOptionController>(
      () => ChooseSignUpOptionController(),
    );
  }
}
