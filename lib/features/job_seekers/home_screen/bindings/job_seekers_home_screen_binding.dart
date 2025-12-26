import 'package:get/get.dart';

import '../../seekers_saved_jobs/controllers/seekers_saved_jobs_controller.dart';
import '../controllers/job_seekers_home_screen_controller.dart';

class JobSeekersHomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSeekersHomeScreenController>(
      () => JobSeekersHomeScreenController(),
    );
  }
}
