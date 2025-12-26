import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_text_style.dart';
import '../../../common/custom_button.dart';
import '../../../theme/image_path.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../../common/text_form_title_text.dart';
import '../controllers/auth_sign_up_screen_controller.dart';

class AuthSignUpScreenView extends GetView<AuthSignUpScreenController> {
  const AuthSignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: const SafeArea(child: LeadingButtonAppbar()),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create \nnew account', style: AppTextStyle.interAuthTitle),
              SizedBox(height: 20.h),

              /// First Name
              TextformTitle(text: 'First Name'),
              SizedBox(height: 5.h),
              TextFormField(
                controller: controller.firstNameController,
                decoration: InputDecoration(hintText: 'Enter your first name'),
              ),
              SizedBox(height: 8.h),

              /// Last Name
              TextformTitle(text: 'Last Name'),
              SizedBox(height: 5.h),
              TextFormField(
                controller: controller.lastNameController,
                decoration: InputDecoration(hintText: 'Enter your last name'),
              ),
              SizedBox(height: 8.h),

              /// Email
              TextformTitle(text: 'Email'),
              SizedBox(height: 5.h),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
                decoration: InputDecoration(hintText: 'Enter your email'),
              ),
              SizedBox(height: 8.h),

              /// Password
              TextformTitle(text: 'Password'),
              SizedBox(height: 5.h),
              Obx(
                () => TextFormField(
                  controller: controller.passwordController,
                  obscureText: controller.passwordVisible.value,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.passwordVisible.value =
                            !controller.passwordVisible.value;
                      },
                      child: controller.passwordVisible.value
                          ? Icon(Icons.visibility_off, color: Color(0xff64748B))
                          : Icon(
                              Icons.visibility_outlined,
                              color: Color(0xff64748B),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),

              /// Confirm Password
              TextformTitle(text: 'Confirm Password'),
              SizedBox(height: 5.h),
              Obx(
                () => TextFormField(
                  controller: controller.passConfirmController,
                  obscureText: controller.passwordConfirmVisible.value,
                  decoration: InputDecoration(
                    hintText: 'Re-enter your password',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        controller.passwordConfirmVisible.value =
                            !controller.passwordConfirmVisible.value;
                      },
                      child: controller.passwordConfirmVisible.value
                          ? Icon(Icons.visibility_off, color: Color(0xff64748B))
                          : Icon(
                              Icons.visibility_outlined,
                              color: Color(0xff64748B),
                            ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              /// Button
              Obx(() {
                return controller.isLoading.value
                    ? Center(child: SpinKitWave(color: Colors.green, size: 40))
                    : CustomButton(
                        text: 'Sign Up',
                        radius: 8,
                        onTap: () {
                          controller.signUpSeekers();
                        },
                      );
              }),
              SizedBox(height: 12.h),

              /// Divider
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Color(0xffD1D6DB), thickness: 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'OR SIGN IN WITH',
                      style: GoogleFonts.inter(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff6B7280),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Color(0xffD1D6DB), thickness: 1),
                  ),
                ],
              ),
              SizedBox(height: 12.h),

              /// Google Button
              Center(
                child: Container(
                  height: 40.h,
                  width: 103.5.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Color(0xffD1D6DB)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(child: Image.asset(ImagePath.googleLogo)),
                ),
              ),
              SizedBox(height: 16.h),

              /// Already have account
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account?",
                    style: AppTextStyle.interSmallTitle,
                    children: [
                      TextSpan(
                        text: " Sign in",
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
