
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_style.dart';
import '../../../common/custom_button.dart';
import '../../../common/text_form_title_text.dart';
import '../controllers/auth_login_screen_controller.dart';

class AuthLoginScreenView extends GetView<AuthLoginScreenController> {
  AuthLoginScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx((){
              if(controller.gmailIsLoading.value){
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: SpinKitFadingCircle(
                    color: AppColors.primaryColor,
                    size: 50.sp,
                    duration: Duration(seconds: 3),
                  )),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'Let\'s \nsign you in!',
                    style: AppTextStyle.interAuthTitle,
                  ),
                  SizedBox(height: 20.h),
                  TextformTitle(text: 'Email'),
                  SizedBox(height: 5.h),
                  TextFormField(
                    controller: controller.emailController,
                    decoration: InputDecoration(hintText: 'Enter your email'),
                  ),
                  SizedBox(height: 5.h),
                  TextformTitle(text: 'Password'),
                  SizedBox(height: 5.h),
                  Obx(() {
                    return TextFormField(
                      controller: controller.passwordController,
                      obscureText: controller.passwordVisible.value,
                      decoration: InputDecoration(
                        hintText: 'Enter your password',
                        suffixIcon: GestureDetector(
                          child: controller.passwordVisible.value
                              ? Icon(Icons.visibility_off, color: Color(0xff64748B))
                              : Icon(Icons.visibility_outlined, color: Color(0xff64748B)),
                          onTap: () {
                            controller.passwordVisible.value =
                            !controller.passwordVisible.value;
                          },
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.AUTH_FORGOT_PASSWORD_EMAIL_SCREEN);
                      },
                      child: Text(
                        'Forgot Password?',
                        style: AppTextStyle.interSmallTitle.copyWith(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Obx((){
                    return controller.isLoading.value
                        ? Center(child: SpinKitWave(
                      color: Colors.green,
                      size: 40.0,
                    ))
                        : CustomButton(
                      text: 'Sign In',
                      radius: 8,
                      onTap: () {
                        controller.loginUser();
                      },
                    );
                  }),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: Color(0xffD1D6DB), thickness: 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
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
                  // SizedBox(height: 12.h),
                  // Center(
                  //   child: GestureDetector(
                  //     onTap: () {
                  //       controller.loginWithGoogle();
                  //     },
                  //     child: Container(
                  //       height: 40.h,
                  //       width: 103.5.w,
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10.r),
                  //         border: Border.all(color: Color(0xffD1D6DB)),
                  //         boxShadow: [
                  //           BoxShadow(
                  //             color: Colors.grey.shade200,
                  //             blurRadius: 4,
                  //             offset: const Offset(0, 2),
                  //           ),
                  //         ],
                  //       ),
                  //       child: Center(child: Image.asset(ImagePath.googleLogo)),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 16.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don’t have an account?",
                        style: AppTextStyle.interSmallTitle,
                        children: [
                          TextSpan(
                            text: " Sign Up",
                            style: AppTextStyle.interSmallTitle.copyWith(
                              color: Color(0xff080A12),
                              fontWeight: FontWeight.w600,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.toNamed(Routes.SIGN_UP_OPTION);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
