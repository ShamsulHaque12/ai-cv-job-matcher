
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../bottom_navbar_screen/controllers/job_seekers_bottom_navbar_screen_controller.dart';
import 'failed_screens.dart';

class SuccessfulScreen extends StatelessWidget {
   SuccessfulScreen({super.key});
  final navbarController = Get.put(JobSeekersBottomNavbarScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeadingButtonAppbar(),
              SizedBox(height: 20.h),
              Lottie.asset('assets/icon/success.json',width: 320.w),
              SizedBox(height: 20.h,),
              Center(
                child: Text('Successful!',style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0066FF),
                ),),
              ),
              SizedBox(height: 10.h,),
              Center(
                child: Text('You have successfully applied to this job vacancy. \nYou \ncan see the job status in the "Applications" section.',textAlign: TextAlign.center,style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4B5563),
                ),),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onTap: () {
                  Get.offAllNamed(Routes.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN,arguments: 1);
                },
                text: "See Applied Jobs List",
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
              SizedBox(height: 15.h,),
              CustomButton(
                onTap: (){
                  navbarController.isselectedIndex.value = 0;
                  Get.offAllNamed(Routes.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN);
                },
                text: "Discover More Jobs",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                borderColor: AppColors.primaryColor,
                borderWidth: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
