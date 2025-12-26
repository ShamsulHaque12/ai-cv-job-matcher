import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/leading_button_app_bar.dart';
import '../controllers/seekers_notification_screen_controller.dart';

class SeekersNotificationScreenView
    extends GetView<SeekersNotificationScreenController> {
  const SeekersNotificationScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Notification",)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => _SettingTile(
              title: 'Get notification',
              value: controller.notification.value,
              onChanged: controller.toggleNotification,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'Update new version',
              value: controller.version.value,
              onChanged: controller.toggleVersoin,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'Suitable job',
              value: controller.jobAvailable.value,
              onChanged: controller.toggleJobs,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'Job notification',
              value: controller.jobNotificatoin.value,
              onChanged: controller.toggleJobNotification,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'Application status',
              value: controller.status.value,
              onChanged: controller.toggleStatus,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'Notice from employer_auth',
              value: controller.noticeEmp.value,
              onChanged: controller.toggleEmp,
            )),
          ],
        ),
      ),
    );
  }
}
class _SettingTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _SettingTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4.r,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: const Color(0xFF1E3A8A),
          ),
        ],
      ),
    );
  }
}
