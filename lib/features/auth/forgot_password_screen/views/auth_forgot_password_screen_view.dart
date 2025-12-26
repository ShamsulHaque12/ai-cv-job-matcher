
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../theme/app_text_style.dart';
import '../../../common/custom_button.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../../common/text_form_title_text.dart';
import '../controllers/auth_forgot_password_screen_controller.dart';

class AuthForgotPasswordScreenView
    extends GetView<AuthForgotPasswordScreenController> {
  AuthForgotPasswordScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: SafeArea(child: LeadingButtonAppbar()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Text('Create \nnew password', style: AppTextStyle.interAuthTitle),
              SizedBox(height: 20.h),

              /// ✅ Email
              TextformTitle(text: 'Email'),
              SizedBox(height: 5.h),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                decoration: InputDecoration(hintText: 'Enter your email'),
              ),
              SizedBox(height: 20.h),

              /// ✅ New Password
              TextformTitle(text: 'New password'),
              SizedBox(height: 5.h),
              Obx(() {
                return TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.passwordVisible.value,
                  decoration: InputDecoration(
                    hintText: '*******',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.passwordVisible.value =
                            !controller.passwordVisible.value;
                      },
                      child: Icon(
                        controller.passwordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility_outlined,
                        color: Color(0xff64748B),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20.h),

              /// ✅ Confirm Password (Separate Toggle)
              TextformTitle(text: 'Confirm new password'),
              SizedBox(height: 5.h),
              Obx(() {
                return TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: controller.confirmPasswordVisible.value,
                  decoration: InputDecoration(
                    hintText: '*******',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.confirmPasswordVisible.value =
                            !controller.confirmPasswordVisible.value;
                      },
                      child: Icon(
                        controller.confirmPasswordVisible.value
                            ? Icons.visibility_off
                            : Icons.visibility_outlined,
                        color: Color(0xff64748B),
                      ),
                    ),
                  ),
                );
              }),
              SizedBox(height: 20.h),

              /// ✅ Submit Button
              Obx(() {
                return controller.isLoading.value
                    ? Center(
                        child: SpinKitWave(color: Colors.green, size: 40.0),
                      )
                    : CustomButton(
                        text: 'Reset Password',
                        radius: 8,
                        onTap: () {
                          controller.resetPassword();
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
