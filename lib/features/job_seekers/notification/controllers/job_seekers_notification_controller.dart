import 'package:get/get.dart';

class JobSeekersNotificationController extends GetxController {
  List<Map<String, dynamic>> notifications = [
    {
      "icon": "assets/icon/apple.png",
      "title": "Your application to Apple Company has been read",
      "time": "17:00 PM",
      "status": "read",
    },
    {
      "icon": "assets/icon/success_job.png",
      "title": "New job available!",
      "time": "16:00 PM",
      "status": "new",
    },
    {
      "icon": "assets/icon/microsoft.png",
      "title": "New company has been joined (NEW)",
      "time": "14:00 PM",
      "status": "new",
    },
    {
      "icon": "assets/icon/congratulations.png",
      "title": "Congratulations, your application on Google has been accepted",
      "time": "15:00 PM",
      "status": "accepted",
    },
    {
      "icon": "assets/icon/apple.png",
      "title": "New company has been joined (NEW)",
      "time": "13:00 PM",
      "status": "new",
    },
    {
      "icon": "assets/icon/microsoft.png",
      "title": "Your Amazon interview is scheduled for tomorrow",
      "time": "11:00 AM",
      "status": "upcoming",
    },
    {
      "icon": "assets/icon/success_job.png",
      "title": "Meta sent you a job offer",
      "time": "10:00 AM",
      "status": "offer",
    },
    {
      "icon": "assets/icon/microsoft.png",
      "title": "LinkedIn: 3 new job recommendations for you",
      "time": "09:30 AM",
      "status": "info",
    },
    {
      "icon": "assets/icon/congratulations.png",
      "title": "Your Twitter application has been viewed",
      "time": "08:45 AM",
      "status": "read",
    },
    {
      "icon": "assets/icon/microsoft.png",
      "title": "Netflix invited you for a technical test",
      "time": "07:30 AM",
      "status": "invited",
    },
  ];

}
