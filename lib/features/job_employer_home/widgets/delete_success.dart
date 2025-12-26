import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../common/custom_button.dart';

class DeleteSuccess extends StatelessWidget {
  const DeleteSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              Lottie.asset('assets/icon/success.json'),
              SizedBox(height: 20.h,),
              Center(
                child: Text('Deleted Posted!',style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0066FF),
                ),),
              ),
              SizedBox(height: 10.h,),
              Center(
                child: Text('Now you can see all the applier CV/Resume and invite them to the next step.',textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF4B5563),
                ),),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onTap: (){
                  Get.toNamed(Routes.BOTTOM_NAV_BAR);
                },
                text: "Go to Applications",
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
              SizedBox(height: 15.h,),
            ],
          ),
        ),
      ),
    );
  }
}
