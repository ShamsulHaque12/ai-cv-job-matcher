import 'package:get/get.dart';

import '../controllers/show_resume_screen_controller.dart';

class ShowResumeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowResumeScreenController>(
      () => ShowResumeScreenController(),
    );
  }
}
