import 'package:get/get.dart';
import '../../../job_employer_home/job_home_employer_screen/controllers/job_home_seker_screen_controller.dart';
import '../controllers/auth_login_screen_controller.dart';

class AuthLoginScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthLoginScreenController>(
      () => AuthLoginScreenController(),
    );
    Get.lazyPut<JobHomeSekerScreenController>(
          () => JobHomeSekerScreenController(),
    );

  }
}
