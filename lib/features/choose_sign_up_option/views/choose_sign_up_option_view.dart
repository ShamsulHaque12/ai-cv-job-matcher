import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';
import '../../theme/image_path.dart';
import '../controllers/choose_sign_up_option_controller.dart';

class ChooseSignUpOptionView extends GetView<ChooseSignUpOptionController> {
  const ChooseSignUpOptionView({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: screenHeight * 0.07,),
                    Image.asset(
                      ImagePath.splashScreenLogo,
                      width: 131.83.w,
                      height: 89.43.h,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Your CV. Our AI. Better Jobs.',
                      style: TextStyle(
                        fontSize: 26.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff2D424F),
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                    "Transforming Resumes into Career Opportunities with AI",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff2D424F),
                        fontSize: 12.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              Text(
                'Continue as',
                style: AppTextStyle.interLargeTitle.copyWith(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10.h),
              Text('There are various categories that assist you in finding a job based on your interest.'),
              SizedBox(height: 12.h,),
              Obx(
                    () => singupOption(
                  ImagePath.jobSeekersImage,
                  'Individual',
                  'Finding a job here never been easier than before',
                  controller.isjobseekersSelected.value,
                      () => controller.isIndividualSelect(),
                ),
              ),
              SizedBox(height: 16.h),
              Obx(
                    () => singupOption(
                  ImagePath.employerImage,
                  'Enterprise',
                  'Let’s recruit your great candidate faster here ',
                  controller.isemployerSelected.value,
                      () => controller.isenterpriseSelect(),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget singupOption(
      String imagePath,
      String title,
      String subtitle,
      bool isselected,
      VoidCallback ontap,
      ) {
    return GestureDetector(
      onTap: ontap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: isselected ? AppColors.primaryColor : null,
          border: Border.all(color: AppColors.dividerColor),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Row(
          children: [
            Image.asset(imagePath, height: 60.h, width: 60.h),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: isselected ? Colors.white : AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isselected
                          ? Colors.white
                          : AppColors.textFormFieldHintTextColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
