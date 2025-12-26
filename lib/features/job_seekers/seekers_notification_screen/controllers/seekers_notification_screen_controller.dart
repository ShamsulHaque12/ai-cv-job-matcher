import 'package:get/get.dart';

class SeekersNotificationScreenController extends GetxController {
  RxBool notification = true.obs;
  RxBool version = true.obs;
  RxBool jobAvailable = false.obs;
  RxBool jobNotificatoin = false.obs;
  RxBool status = false.obs;
  RxBool noticeEmp = false.obs;

  void toggleNotification(bool value) => notification.value = value;
  void toggleVersoin(bool value) => version.value = value;
  void toggleJobs(bool value) => jobAvailable.value = value;
  void toggleJobNotification(bool value) => jobNotificatoin.value = value;
  void toggleStatus(bool value) => status.value = value;
  void toggleEmp(bool value) => noticeEmp.value = value;
}
