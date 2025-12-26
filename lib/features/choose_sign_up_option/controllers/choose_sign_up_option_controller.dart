import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class ChooseSignUpOptionController extends GetxController {
  final isjobseekersSelected = false.obs;
  final isemployerSelected = false.obs;

  void isIndividualSelect() async {
    isjobseekersSelected.value = true;
    isemployerSelected.value = false;
    await Future.delayed(Duration(seconds: 1));
     Get.toNamed(Routes.EMPLOYER_INDIVIDUAL_SIGN_UP_SCREEN);
  }

  void isenterpriseSelect() async {
    isjobseekersSelected.value = false;
    isemployerSelected.value = true;
    await Future.delayed(Duration(seconds: 1));
     Get.toNamed(Routes.EMPLOYER_AUTH_ENTERPRISE_SIGN_UP_SCREEN);
  }


}
