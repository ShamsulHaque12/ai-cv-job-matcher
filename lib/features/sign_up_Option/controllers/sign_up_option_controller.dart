import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SignUpOptionController extends GetxController {
  //TODO: Implement SignUpOptionController

  final isjobseekersSelected = false.obs;
  final isemployerSelected = false.obs;

  void isJobseekerSelect() async {
    isjobseekersSelected.value = true;
    isemployerSelected.value = false;
    await Future.delayed(Duration(seconds: 1));
      Get.toNamed(Routes.AUTH_SIGN_UP_SCREEN);
  }

  void isEmployerSelect() async {
    isjobseekersSelected.value = false;
    isemployerSelected.value = true;
    await Future.delayed(Duration(seconds: 1));
     Get.toNamed(Routes.CHOOSE_SIGN_UP_OPTION);
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
