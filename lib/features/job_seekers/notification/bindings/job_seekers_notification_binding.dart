import 'package:get/get.dart';

import '../controllers/job_seekers_notification_controller.dart';

class JobSeekersNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobSeekersNotificationController>(
      () => JobSeekersNotificationController(),
    );
  }
}
