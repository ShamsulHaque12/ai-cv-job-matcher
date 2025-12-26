import 'package:get/get.dart';

import '../controllers/all_inactive_screen_controller.dart';

class AllInactiveScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllInactiveScreenController>(
      () => AllInactiveScreenController(),
    );
  }
}
