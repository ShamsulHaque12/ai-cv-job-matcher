import 'package:get/get.dart';

import '../controllers/seekers_edit_profile_screen_controller.dart';

class SeekersEditProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeekersEditProfileScreenController>(
      () => SeekersEditProfileScreenController(),
    );
  }
}
