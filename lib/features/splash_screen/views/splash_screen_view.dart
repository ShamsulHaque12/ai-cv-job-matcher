import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../../theme/image_path.dart';
import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  ImagePath.splashScreenLogo,
                  width: double.infinity,
                  height: 100.h,
                  // fit: BoxFit.cover,
                ),
                SizedBox(height: 8.h),
                Text(
                  'Job Search',
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff2D424F),
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                'AI-Powered CV Analysis for Smarter Job Matching',
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
          // Spinner slightly above bottom
          Positioned(
            bottom: 50.h,
            left: 0,
            right: 0,
            child: Center(
              child: SpinKitFadingCircle(
                color: AppColors.primaryColor,
                size: 50.sp,
                duration: Duration(seconds: 3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
