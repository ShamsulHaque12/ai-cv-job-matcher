import 'package:get/get.dart';

class EditNotificationController extends GetxController {
  RxBool soundEnabled = true.obs;
  RxBool vibrateEnabled = true.obs;
  RxBool newTipsAvailable = false.obs;
  RxBool newServiceAvailable = false.obs;

  void toggleSound(bool value) => soundEnabled.value = value;
  void toggleVibrate(bool value) => vibrateEnabled.value = value;
  void toggleNewTips(bool value) => newTipsAvailable.value = value;
  void toggleNewService(bool value) => newServiceAvailable.value = value;
}