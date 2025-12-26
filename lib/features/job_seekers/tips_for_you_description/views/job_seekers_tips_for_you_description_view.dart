import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/leading_button_app_bar.dart';
import '../controllers/job_seekers_tips_for_you_description_controller.dart';

class JobSeekersTipsForYouDescriptionView
    extends GetView<JobSeekersTipsForYouDescriptionController> {
  const JobSeekersTipsForYouDescriptionView({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),
              Stack(
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
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff99ABC6),
                              spreadRadius: 4,
                              blurRadius: 40,
                            ),
                          ],
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
              SizedBox(height: screenHeight * 0.05),
              Text('How to Find a perfect job for you',style: GoogleFonts.inter(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF2C3E50),
              ),),
              SizedBox(height: screenHeight * 0.02),
              Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit,sed do eiusmod tempor incididunt ut labore et doloremagna aliqua- Urna id volutpat lacus Iaoreet noncurabitur gravida arcu. Amet nisl purus in mollis nuncsed id. Elementum curabitur vitae nunc sed. Apellentesque sit amet porttitor eget. Ac turpis egestasinteger eget aliquet nibh. Nibh praesent tristique magnasit amet purus gravida. Sagittis nisl rhoncus mattisrhoncus uma neque viverra. Volutpat sed cras ornarearcu dui vivamus arcu felis bibendum.Sagittis vitae et leo duis ut diam. Et pharetra pharetramassa massa. Faucibus et molestie ac feugiat. Ac feugiatsed lectus vestibulum. Sagittis eu volutpat odio facilisis.Venenatis urna cursus eget nunc scelerisque viverramauris.',style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF4B5563),
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
