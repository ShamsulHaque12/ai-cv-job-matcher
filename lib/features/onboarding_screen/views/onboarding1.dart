
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_text_style.dart';
import '../../theme/image_path.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 24.h),
              Center(
                child: Image.asset(
                  ImagePath.findDreamJobImage,
                  width: 280.w,
        
                ),
              ),
              SizedBox(height: 8.h),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Let ",
                      style: AppTextStyle.interLargeTitle,
                    ),
                    TextSpan(
                      text: "AI Match\n",
                      style: GoogleFonts.inter(
                        color: Color(0xff10B981),
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff10B981),
                        decorationThickness: 1,
                      ),
                    ),
                    TextSpan(
                      text: "Transforming Resumes into Career Opportunities with AI",
                      style: AppTextStyle.interLargeTitle,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
        
              // Subtitle / Description
              Text(
                "Upload your resume and let our AI instantly scan your skills, experience, and preferences to recommend jobs tailored to you.",
                style: AppTextStyle.interSmallTitle,
              )
            ],
          ),
        ),
      ),
    );
  }
}