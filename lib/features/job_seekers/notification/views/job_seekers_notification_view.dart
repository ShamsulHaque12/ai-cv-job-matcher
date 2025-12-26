import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/leading_button_app_bar.dart';
import '../controllers/job_seekers_notification_controller.dart';

class JobSeekersNotificationView
    extends GetView<JobSeekersNotificationController> {
  const JobSeekersNotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8.0),
          child: SafeArea(child: LeadingButtonAppbar(text: 'Notification',)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
            itemBuilder: (context,index){
              final notification = controller.notifications[index];
              return Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                ),
                child:ListTile(
                  leading: Image.asset(notification['icon']),
                  title: Text(notification['title']),
                  subtitle: Text(notification['time']),
                ),
              );
            },
            separatorBuilder: (context, index){
              return  SizedBox(height: 10.h,);
            },
            itemCount: controller.notifications.length
        ),
      ),
    );
  }
}
