import 'package:get/get.dart';

import '../controllers/edit_requirment_screen_controller.dart';

class EditRequirmentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditRequirmentScreenController>(
      () => EditRequirmentScreenController(),
    );
  }
}
