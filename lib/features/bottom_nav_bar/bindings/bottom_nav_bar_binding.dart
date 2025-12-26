import 'package:get/get.dart';
import '../../employer_auth/auth/company_information/controllers/employer_auth_company_information_controller.dart';
import '../../job_employer_home/all_post_screen/controllers/all_post_screen_controller.dart';
import '../../job_employer_home/applicatios_screen/controllers/applicatios_screen_controller.dart';
import '../../job_employer_home/creat_requirment_screen/controllers/creat_requirment_screen_controller.dart';
import '../../job_employer_home/employer_profile_screen/controllers/employer_profile_screen_controller.dart';
import '../../job_employer_home/job_home_employer_screen/controllers/job_home_seker_screen_controller.dart';
import '../controllers/bottom_nav_bar_controller.dart';

class BottomNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomNavBarController>(
      () => BottomNavBarController(),
    );
    Get.lazyPut<ApplicatiosScreenController>(
      () => ApplicatiosScreenController(),
    );
    Get.lazyPut<JobHomeSekerScreenController>(
          () => JobHomeSekerScreenController(),
    );
    Get.lazyPut<AllPostScreenController>(
          () => AllPostScreenController(),
    );
    Get.lazyPut<EmployerProfileScreenController>(
          () => EmployerProfileScreenController(),
    );
    Get.lazyPut<CreatRequirmentScreenController>(
          () => CreatRequirmentScreenController(),
    );
    Get.lazyPut<EmployerAuthCompanyInformationController>(
          () => EmployerAuthCompanyInformationController(),
    );
  }
}
