import 'package:get/get.dart';

import '../controllers/employer_auth_contact_information_controller.dart';

class EmployerAuthContactInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployerAuthContactInformationController>(
      () => EmployerAuthContactInformationController(),
    );
  }
}
