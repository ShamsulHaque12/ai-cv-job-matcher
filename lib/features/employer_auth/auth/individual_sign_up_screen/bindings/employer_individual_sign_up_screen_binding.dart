import 'package:get/get.dart';

import '../controllers/employer_individual_sign_up_screen_controller.dart';

class EmployerIndividualSignUpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployerIndividualSignUpScreenController>(
      () => EmployerIndividualSignUpScreenController(),
    );
  }
}
