import 'package:get/get.dart';

import '../controllers/see_all_my_job_screen_controller.dart';

class SeeAllMyJobScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeAllMyJobScreenController>(
      () => SeeAllMyJobScreenController(),
    );
  }
}
