import 'package:get/get.dart';

import '../model/all_notification_model.dart';

class NotificationScreenController extends GetxController {
  RxList<AllNotificationModel> notificationList = <AllNotificationModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    allNotificationList();
  }

  void allNotificationList() async {
    notificationList.value = [
      AllNotificationModel(
        text: "10 people have applied in the last 1 hour",
        image: "assets/icon/new_applied.png",
        time: "2.00PM",
      ),
      AllNotificationModel(
        text: "Congratulations, your profilehas been completed",
        image: "assets/icon/congratulation.png",
        time: "2.00PM",
      ),
    ];
  }
}
