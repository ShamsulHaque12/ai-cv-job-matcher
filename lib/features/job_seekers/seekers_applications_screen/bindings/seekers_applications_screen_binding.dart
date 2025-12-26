import 'package:get/get.dart';

import '../../application_detail_screens/controllers/application_detail_screens_controller.dart';
import '../controllers/seekers_applications_screen_controller.dart';

class SeekersApplicationsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationDetailScreensController>(
      () => ApplicationDetailScreensController(),
    );
  }
}
