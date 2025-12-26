import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/job_seekers_tips_for_you_controller.dart';

class JobSeekersTipsForYouView extends GetView<JobSeekersTipsForYouController> {
  const JobSeekersTipsForYouView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8.0),
          child: SafeArea(child: LeadingButtonAppbar(text: 'Tips for you',)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 14.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.JOB_SEEKERS_TIPS_FOR_YOU_DESCRIPTION);
                },
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF000000),
                                Color(0xFF1E3A8A),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 16.h,
                          bottom: 0
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "How to Find a\nperfect job for you",
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 14.h),
                                Container(
                                  margin: EdgeInsets.only(bottom: 25),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    "Read more",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1E3A8A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Right side girl image
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                "assets/images/female.png",
                                height: 122.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.JOB_SEEKERS_TIPS_FOR_YOU_DESCRIPTION);
                },
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFF008CFF),
                                Color(0xFFFF3D3D),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 16.h,
                          bottom: 0
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "How to Find a\nperfect job for you",
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 14.h),
                                Container(
                                  margin: EdgeInsets.only(bottom: 25),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    "Read more",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1E3A8A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Right side girl image
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                "assets/images/female.png",
                                height: 122.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.JOB_SEEKERS_TIPS_FOR_YOU_DESCRIPTION);
                },
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xFFFC4E71),
                                Color(0xFF1E8A78),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20.r)
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          top: 16.h,
                          bottom: 0
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "How to Find a\nperfect job for you",
                                  style: GoogleFonts.inter(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 14.h),
                                Container(
                                  margin: EdgeInsets.only(bottom: 25),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20.w, vertical: 8.h),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Text(
                                    "Read more",
                                    style: GoogleFonts.inter(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF1E3A8A),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Right side girl image
                          Expanded(
                            flex: 2,
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Image.asset(
                                "assets/images/female.png",
                                height: 122.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
