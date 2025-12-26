import 'package:get/get.dart';

import '../controllers/employer_auth_enterprise_sign_up_screen_controller.dart';

class EmployerAuthEnterpriseSignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployerAuthEnterpriseSignUpScreenController>(
      () => EmployerAuthEnterpriseSignUpScreenController(),
    );
  }
}
