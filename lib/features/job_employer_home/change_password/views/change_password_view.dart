import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../common/custom_button.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../../common/text_form_title_text.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Change Password")),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextformTitle(text: 'Old Password'),
            SizedBox(height: 5.h),
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                obscureText: controller.passwordVisible.value,
                decoration: InputDecoration(
                  hintText: '*******',
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
            SizedBox(height: 10.h),
            TextformTitle(text: 'Enter New Password'),
            SizedBox(height: 5.h),
            Obx(
              () => TextFormField(
                controller: controller.passwordController,
                obscureText: controller.passwordVisible.value,
                decoration: InputDecoration(
                  hintText: '*******',
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
            SizedBox(height: 10.h),

            /// Confirm Password
            TextformTitle(text: 'Confirm Password'),
            SizedBox(height: 5.h),
            Obx(
              () => TextFormField(
                controller: controller.passConfirmController,
                obscureText: controller.passwordConfirmVisible.value,
                decoration: InputDecoration(
                  hintText: '*******',
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
            Obx(() {
              return controller.isLoading.value
                  ? Center(child: SpinKitWave(color: Colors.green, size: 40.0))
                  : CustomButton(
                      text: 'Change Password',
                      onTap: () {
                        controller.changePassword();
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}
