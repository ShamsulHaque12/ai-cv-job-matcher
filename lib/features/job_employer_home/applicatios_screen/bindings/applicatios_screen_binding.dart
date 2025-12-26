import 'package:get/get.dart';

import '../controllers/applicatios_screen_controller.dart';

class ApplicatiosScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApplicatiosScreenController());
  }
}
