import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobly_ai/features/job_employer_home/edit_employer_profile/helps_faq/tips_screen.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/faq_screen_controller.dart';
import 'account_screen.dart';
import 'genarel_screen.dart';
import 'login_screen.dart';

class FaqScreen extends StatelessWidget {
  final FaqScreenController controller = Get.put(FaqScreenController());
  FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "FAQ")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Row(
                children: [
                  _buildFilterButton(
                    label: 'General',
                    isSelected: controller.selectedFilter.value == 'General',
                    onTap: () => controller.selectedFilter.value = 'General',
                  ),
                  SizedBox(width: 5.w),
                  _buildFilterButton(
                    label: 'Login',
                    isSelected: controller.selectedFilter.value == 'Login',
                    onTap: () => controller.selectedFilter.value = 'Login',
                  ),
                  SizedBox(width: 5.w),
                  _buildFilterButton(
                    label: 'Account',
                    isSelected: controller.selectedFilter.value == 'Account',
                    onTap: () => controller.selectedFilter.value = 'Account',
                  ),
                  SizedBox(width: 5.w),
                  _buildFilterButton(
                    label: 'Tips',
                    isSelected: controller.selectedFilter.value == 'Tips',
                    onTap: () => controller.selectedFilter.value = 'Tips',
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Obx(() {
              return SizedBox(
                height: height * 0.55,
                child: _buildContent(controller.selectedFilter.value),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: isSelected ? const Color(0xFF1E3A8A) : Colors.white,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(color: const Color(0xFF1E3A8A), width: 2),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : const Color(0xFF1E3A8A),
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(String filter) {
    switch (filter) {
      case 'General':
        return GeneralScreen();
      case 'Login':
        return LoginScreen();
      case 'Account':
        return AccountScreen();
      case 'Tips':
        return TipsScreen();
      default:
        return _buildEmptyState("No vacancies found");
    }
  }

  Widget _buildEmptyState(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
