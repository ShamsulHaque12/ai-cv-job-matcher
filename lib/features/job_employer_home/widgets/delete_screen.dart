import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../../theme/app_colors.dart';
import '../../common/custom_button.dart';
import '../../common/leading_button_app_bar.dart';

class DeleteScreen extends StatelessWidget {
  const DeleteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeigh = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Lottie.asset('assets/icon/Failed.json',width: 320.w),
              SizedBox(height: 20.h),
              Center(
                child: Text(
                  'Failed',
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF5977),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Center(
                child: Text(
                  'Please make sure that your internet connection is active and stable, then press "Try Again"',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF4B5563),
                  ),
                ),
              ),
              SizedBox(height: screenHeigh * 0.09),
              CustomButton(
                onTap: (){
                  Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
                },
                text: "Try Again",
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
