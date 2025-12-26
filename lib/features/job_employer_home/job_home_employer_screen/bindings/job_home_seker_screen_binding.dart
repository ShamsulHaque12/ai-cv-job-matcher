import 'package:get/get.dart';

import '../../applicatios_screen/controllers/applicatios_screen_controller.dart';
import '../../creat_requirment_screen/controllers/creat_requirment_screen_controller.dart';
import '../../see_all_my_job_screen/controllers/see_all_my_job_screen_controller.dart';
import '../controllers/job_home_seker_screen_controller.dart';

class JobSekerJobHomeSekerScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobHomeSekerScreenController>(
      () => JobHomeSekerScreenController(),
    );
    Get.lazyPut<SeeAllMyJobScreenController>(
      () => SeeAllMyJobScreenController(),
    );
    Get.lazyPut<CreatRequirmentScreenController>(
      () => CreatRequirmentScreenController(),
    );
  }
}
