import 'package:get/get.dart';

import '../controllers/seekers_job_details_screen_controller.dart';

class SeekersJobDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeekersJobDetailsScreenController>(
      () => SeekersJobDetailsScreenController(),
    );
  }
}
