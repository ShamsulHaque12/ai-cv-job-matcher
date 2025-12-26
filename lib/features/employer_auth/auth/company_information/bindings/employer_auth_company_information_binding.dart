import 'package:get/get.dart';

import '../controllers/employer_auth_company_information_controller.dart';

class EmployerAuthCompanyInformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployerAuthCompanyInformationController>(
      () => EmployerAuthCompanyInformationController(),
    );
  }
}
