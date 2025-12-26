import 'package:get/get.dart';

import '../controllers/join_membar_screen_controller.dart';

class JoinMembarScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JoinMembarScreenController>(
      () => JoinMembarScreenController(),
    );
  }
}
