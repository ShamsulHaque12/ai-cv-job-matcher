import 'package:get/get.dart';

import '../../../employer_auth/auth/contact_information/controllers/employer_auth_contact_information_controller.dart';
import '../../edit_employer_profile/controllers/edit_employer_profile_controller.dart';
import '../controllers/employer_profile_screen_controller.dart';

class EmployerProfileScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployerProfileScreenController>(
      () => EmployerProfileScreenController(),
    );
    Get.lazyPut<EmployerAuthContactInformationController>(
      () => EmployerAuthContactInformationController(),
    );
    Get.lazyPut<EditEmployerProfileController>(
      () => EditEmployerProfileController(),
    );
  }
}
