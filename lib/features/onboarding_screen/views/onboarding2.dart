import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../../theme/app_text_style.dart';
import '../../common/custom_button.dart';
import '../../theme/image_path.dart';
import '../../../services/shared_preferences_helper.dart'; // ✅ Add this import!!

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Image.asset(ImagePath.findDreamJobImage, width: 280.w),
              ),
              SizedBox(height: 8.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Find Qualified Candidates— \n",
                      style: AppTextStyle.interLargeTitle,
                    ),
                    TextSpan(
                      text: "Powered by AI",
                      style: GoogleFonts.inter(
                        color: Color(0xff10B981),
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff10B981),
                        decorationThickness: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                "Paste a job description or upload a PDF and our AI will surface the best-fit candidates instantly.",
                style: AppTextStyle.interSmallTitle,
              ),
              SizedBox(height: screenHeight * 0.2),
              CustomButton(
                text: 'Get Started',
                radius: 99,
                onTap: () async {
                  Get.toNamed(Routes.AUTH_LOGIN_SCREEN);
                  // final token = await SharedPreferencesHelper.getAccessToken();
                  // final role = await SharedPreferencesHelper.getRole();
                  //
                  // if (token != null && token.isNotEmpty) {
                  //   /// ✅ role wise navigation
                  //   if (role == "EMPLOYEE") {
                  //     Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
                  //   } else if (role == "JOB_SEEKER") {
                  //     Get.offAllNamed(Routes.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN);
                  //   } else {
                  //     Get.toNamed(Routes.AUTH_LOGIN_SCREEN);
                  //   }
                  // } else {
                  //   /// ❌ token missing → go login
                  //   Get.toNamed(Routes.AUTH_LOGIN_SCREEN);
                  // }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
