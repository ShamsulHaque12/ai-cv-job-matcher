
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../theme/app_text_style.dart';
import '../../../common/custom_button.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../../common/sign_up_title_small.dart';
import '../../../common/text_form_title_text.dart';
import '../controllers/auth_forgot_password_email_screen_controller.dart';

class AuthForgotPasswordEmailScreenView
    extends GetView<AuthForgotPasswordEmailScreenController> {
  const AuthForgotPasswordEmailScreenView({super.key});
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
              SizedBox(height: 10.h),
              Text('Reset your password', style: AppTextStyle.interAuthTitle),
              SizedBox(height: 15.h),
              SignUpTitleSmall(
                text:
                    'Enter your email associated with your account and we’ll send you OTP to reset your password',
              ),
              SizedBox(height: 20.h),
              TextformTitle(text: 'Email'),
              SizedBox(height: 5.h),
              TextFormField(
                controller: controller.emailController,
                decoration: InputDecoration(hintText: 'Enter your email'),
              ),
              SizedBox(height: 20.h),
              Obx((){
                return controller.isLoading.value
                    ? Center(child: SpinKitWave(
                  color: Colors.green,
                  size: 40.0,
                ))
                    :CustomButton(
                  text: 'Get OTP',
                  radius: 8,
                  onTap: () {
                    controller.forgotPassword();
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
