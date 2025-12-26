import 'package:get/get.dart';

import '../controllers/job_seekers_tips_for_you_description_controller.dart';

class JobSeekersTipsForYouDescriptionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSeekersTipsForYouDescriptionController>(
      () => JobSeekersTipsForYouDescriptionController(),
    );
  }
}
