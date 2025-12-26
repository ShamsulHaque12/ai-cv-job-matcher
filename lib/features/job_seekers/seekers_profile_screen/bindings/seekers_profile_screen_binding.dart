import 'package:get/get.dart';

import '../controllers/seekers_profile_screen_controller.dart';

class SeekersProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeekersProfileScreenController>(
      () => SeekersProfileScreenController(),
    );
  }
}
