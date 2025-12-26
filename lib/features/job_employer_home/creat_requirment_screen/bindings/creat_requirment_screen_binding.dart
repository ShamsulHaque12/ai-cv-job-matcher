import 'package:get/get.dart';

import '../../../employer_auth/auth/company_information/controllers/employer_auth_company_information_controller.dart';
import '../controllers/creat_requirment_screen_controller.dart';

class CreatRequirmentScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreatRequirmentScreenController>(
      () => CreatRequirmentScreenController(),
    );
    Get.lazyPut<EmployerAuthCompanyInformationController>(
      () => EmployerAuthCompanyInformationController(),
    );
  }
}
