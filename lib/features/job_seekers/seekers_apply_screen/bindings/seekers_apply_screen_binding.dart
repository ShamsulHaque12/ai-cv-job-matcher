import 'package:get/get.dart';

import '../../bottom_navbar_screen/controllers/job_seekers_bottom_navbar_screen_controller.dart';
import '../controllers/seekers_apply_screen_controller.dart';

class SeekersApplyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeekersApplyScreenController>(
      () => SeekersApplyScreenController(),
    );
    Get.lazyPut<JobSeekersBottomNavbarScreenController>(
      () => JobSeekersBottomNavbarScreenController(),
    );
  }
}
