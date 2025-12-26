import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/edit_notificatoin_controller.dart';

class EditNotificationScreen extends StatelessWidget {
  final EditNotificationController editNotificationController = Get.put(EditNotificationController());

  EditNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Edit Notification")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => _SettingTile(
              title: 'Sound',
              value: editNotificationController.soundEnabled.value,
              onChanged: editNotificationController.toggleSound,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'Vibrate',
              value: editNotificationController.vibrateEnabled.value,
              onChanged: editNotificationController.toggleVibrate,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'New tips available',
              value: editNotificationController.newTipsAvailable.value,
              onChanged: editNotificationController.toggleNewTips,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'New service available',
              value: editNotificationController.newServiceAvailable.value,
              onChanged: editNotificationController.toggleNewService,
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