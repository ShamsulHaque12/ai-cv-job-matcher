import 'package:get/get.dart';

import '../controllers/job_seekers_tips_for_you_controller.dart';

class JobSeekersTipsForYouBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSeekersTipsForYouController>(
      () => JobSeekersTipsForYouController(),
    );
  }
}
