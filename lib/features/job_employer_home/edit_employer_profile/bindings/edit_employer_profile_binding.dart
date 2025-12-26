import 'package:get/get.dart';

import '../../../employer_auth/auth/contact_information/controllers/employer_auth_contact_information_controller.dart';
import '../controllers/edit_employer_profile_controller.dart';

class EditEmployerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditEmployerProfileController>(
      () => EditEmployerProfileController(),
    );
    Get.lazyPut<EmployerAuthContactInformationController>(
      () => EmployerAuthContactInformationController(),
    );
  }
}
