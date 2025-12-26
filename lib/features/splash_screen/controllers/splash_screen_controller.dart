import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../services/shared_preferences_helper.dart';

class SplashScreenController extends GetxController {
  //TODO: Implement SplashScreenController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), ()async {
      final token = await SharedPreferencesHelper.getAccessToken();
      final role = await SharedPreferencesHelper.getRole();
      if (token != null && token.isNotEmpty) {
        if (role == 'JOB_SEEKER') {
          Get.offAllNamed(Routes.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN);
        } else if (role == 'EMPLOYEE') {
          Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
        }
      }else {
        Get.offAllNamed(Routes.AUTH_LOGIN_SCREEN);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
