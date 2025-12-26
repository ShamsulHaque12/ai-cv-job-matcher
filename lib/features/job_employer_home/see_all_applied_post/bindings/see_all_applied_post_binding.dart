import 'package:get/get.dart';

import '../controllers/see_all_applied_post_controller.dart';

class SeeAllAppliedPostBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeAllAppliedPostController>(
      () => SeeAllAppliedPostController(),
    );
  }
}
