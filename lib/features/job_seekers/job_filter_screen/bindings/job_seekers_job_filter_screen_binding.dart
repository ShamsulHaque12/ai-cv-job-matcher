import 'package:get/get.dart';

import '../controllers/job_seekers_job_filter_screen_controller.dart';

class JobSeekersJobFilterScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSeekersJobFilterScreenController>(
      () => JobSeekersJobFilterScreenController(),
    );
  }
}
