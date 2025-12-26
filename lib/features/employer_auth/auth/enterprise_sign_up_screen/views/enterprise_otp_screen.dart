import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../theme/app_colors.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../common/custom_button.dart';
import '../../../../theme/image_path.dart';
import '../../../../common/leading_button_app_bar.dart';
import '../../../../common/sign_up_title_small.dart';
import '../controllers/enterprise_otp_controller.dart';

class EnterpriseOtpScreen extends StatelessWidget {
  final EnterpriseOtpController controller = Get.put(EnterpriseOtpController());
  final String email;
  EnterpriseOtpScreen({super.key, required this.email});

  void successAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(Duration(seconds: 2), () {
          controller.verifyEnterpriseOtp(controller.pinController.text.trim());
        });
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Colors.white,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Circle icon
                  Container(
                    width: 175.42.w,
                    height: 100.99.h,
                    padding: const EdgeInsets.all(8),
                    child: Image.asset(
                      ImagePath.successAlert,
                      width: 250.42.w,
                      height: 50,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Main Text
                  Text(
                    "Account verified\nSuccessfully",
                    textAlign: TextAlign.center,
                    style: AppTextStyle.interSmallTitle.copyWith(
                      fontSize: 20.sp,
                      color: Color(0xff2D2D2D),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Sub Text
                  Text(
                    "You have successfully Sign Up",
                    style: AppTextStyle.interSmallTitle.copyWith(
                      color: Color(0xff2D2D2D),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  // Loading indicator
                  Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primaryColor,
                      size: 50.sp,
                      duration: Duration(seconds: 3),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
          child: SafeArea(child: LeadingButtonAppbar()),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                'Enter \nverification code',
                style: AppTextStyle.interAuthTitle,
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(
                text:
                'The verification code has been sent to \n${email.toString()} \nPlease enter the code to continue.',
              ),
              SizedBox(height: 16.h),
              Center(
                child: Pinput(
                  length: 6,
                  controller: controller.pinController,
                  defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 54.h,
                    textStyle: TextStyle(
                      fontSize: 20.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(color: Color(0xffF3F4F6)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Obx(() {
                return Center(
                  child: TextButton(
                    onPressed: controller.seconds.value == 0
                        ? controller.resendCode
                        : null,
                    child: controller.seconds.value == 0
                        ? Text(
                      "Resend Code",
                      style: AppTextStyle.interSmallTitle.copyWith(
                        color: Color(0xff2C3E50),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                        : Text(
                      "Resend Code (00:${controller.seconds.value.toString().padLeft(2, '0')})",
                      style: AppTextStyle.interSmallTitle.copyWith(
                        color: Color(0xff2C3E50),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20.h),
              CustomButton(
                text: 'Continue',
                radius: 8,
                onTap: () {
                  if (controller.pinController.text.trim().isEmpty) {
                    Get.snackbar(
                      'Error',
                      'Please enter the OTP',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                    return;
                  }
                  successAlert(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
