import 'package:get/get.dart';

import '../controllers/seekers_notification_screen_controller.dart';

class SeekersNotificationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeekersNotificationScreenController>(
      () => SeekersNotificationScreenController(),
    );
  }
}
