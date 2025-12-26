import 'package:get/get.dart';

import '../../job_filter_screen/controllers/job_seekers_job_filter_screen_controller.dart';
import '../controllers/job_seekers_search_controller.dart';

class JobSeekersSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSeekersSearchController>(
      () => JobSeekersSearchController(),
    );
    Get.lazyPut<JobSeekersJobFilterScreenController>(
      () => JobSeekersJobFilterScreenController(),
    );
  }
}
