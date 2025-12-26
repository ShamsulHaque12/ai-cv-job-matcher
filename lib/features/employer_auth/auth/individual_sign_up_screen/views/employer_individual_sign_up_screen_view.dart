import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../theme/app_text_style.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/leading_button_app_bar.dart';
import '../../../../common/text_form_title_text.dart';
import '../controllers/employer_individual_sign_up_screen_controller.dart';

class EmployerIndividualSignUpScreenView
    extends GetView<EmployerIndividualSignUpScreenController> {
  const EmployerIndividualSignUpScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
          child: SafeArea(child: LeadingButtonAppbar(text: 'Individual')),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              TextformTitle(text: 'First Name'),
              SizedBox(height: 5.h),
              TextFormField(
                controller: controller.firstNameController,
                decoration: InputDecoration(hintText: 'Enter your firstName'),
              ),
              SizedBox(height: 8.h),
              TextformTitle(text: 'Last Name'),
              SizedBox(height: 5.h),
              TextFormField(
                controller: controller.lastNameController,
                decoration: InputDecoration(hintText: 'Enter your lastName'),
              ),
              SizedBox(height: 8.h),
              TextformTitle(text: 'Email'),
              SizedBox(height: 5.h),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                decoration: InputDecoration(hintText: 'Enter your email'),
              ),
              SizedBox(height: 8.h),
              TextformTitle(text: 'Password'),
              SizedBox(height: 5.h),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: !controller.passwordVisible.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.passwordVisible.value =
                            !controller.passwordVisible.value;
                      },
                      child: Icon(
                        controller.passwordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                        color: Color(0xff64748B),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              TextformTitle(text: 'Confirm new password'),
              SizedBox(height: 5.h),
              Obx(
                () => TextFormField(
                  controller: controller.confirmPasswordController,
                  obscureText: !controller.confirmPasswordVisible.value,
                  decoration: InputDecoration(
                    hintText: '******',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.confirmPasswordVisible.value =
                            !controller.confirmPasswordVisible.value;
                      },
                      child: Icon(
                        controller.confirmPasswordVisible.value
                            ? Icons.visibility_outlined
                            : Icons.visibility_off,
                        color: Color(0xff64748B),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Obx(() {
                return controller.isLoading.value
                    ? Center(child: SpinKitWave(color: Colors.blue, size: 40.0))
                    : CustomButton(
                        text: 'Sign Up',
                        radius: 8,
                        onTap: () {
                          controller.signUpIndividual();
                        },
                      );
              }),
              SizedBox(height: 30.h),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: AppTextStyle.interSmallTitle,
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: AppTextStyle.interSmallTitle.copyWith(
                          color: Color(0xff080A12),
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(Routes.AUTH_LOGIN_SCREEN);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
