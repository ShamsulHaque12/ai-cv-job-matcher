import 'package:get/get.dart';

import '../controllers/application_detail_screens_controller.dart';

class ApplicationDetailScreensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationDetailScreensController>(
      () => ApplicationDetailScreensController(),
    );
  }
}
