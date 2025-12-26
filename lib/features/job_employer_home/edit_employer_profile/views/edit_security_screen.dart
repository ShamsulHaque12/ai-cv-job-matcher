import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/leading_button_app_bar.dart';
import '../controllers/edit_security_controller.dart';

class EditSecurityScreen extends StatelessWidget {
  final EditSecurityController editSecurityController = Get.put(EditSecurityController());
  EditSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Edit Security")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => _SettingTile(
              title: 'Face ID',
              value: editSecurityController.faceEnabled.value,
              onChanged: editSecurityController.toggleFace,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'Remember me',
              value: editSecurityController.remembarEnabled.value,
              onChanged: editSecurityController.toggleRemembar,
            )),
            SizedBox(height: 16.h),
            Obx(() => _SettingTile(
              title: 'Touch ID',
              value: editSecurityController.touchEnabled.value,
              onChanged: editSecurityController.toggleTouch,
            )),
            SizedBox(height: 16.h),

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
            activeTrackColor: Color(0xFF1E3A8A),
          ),
        ],
      ),
    );
  }
}
