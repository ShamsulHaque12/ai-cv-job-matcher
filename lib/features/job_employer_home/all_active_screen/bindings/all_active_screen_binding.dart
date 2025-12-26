import 'package:get/get.dart';

import '../controllers/all_active_screen_controller.dart';

class AllActiveScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllActiveScreenController>(
      () => AllActiveScreenController(),
    );
  }
}
