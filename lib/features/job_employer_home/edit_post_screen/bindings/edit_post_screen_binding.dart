import 'package:get/get.dart';

import '../controllers/edit_post_screen_controller.dart';

class EditPostScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditPostScreenController>(
      () => EditPostScreenController(),
    );
  }
}
