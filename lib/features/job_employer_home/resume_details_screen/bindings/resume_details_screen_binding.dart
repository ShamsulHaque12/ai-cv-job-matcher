import 'package:get/get.dart';

import '../controllers/resume_details_screen_controller.dart';

class ResumeDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResumeDetailsScreenController>(
      () => ResumeDetailsScreenController(),
    );
  }
}
