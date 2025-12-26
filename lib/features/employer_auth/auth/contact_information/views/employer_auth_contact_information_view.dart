
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobly_ai/features/theme/image_path.dart';
import '../../../../common/custom_button.dart';
import '../../../../common/leading_button_app_bar.dart';
import '../../../../common/sign_up_title_small.dart';
import '../controllers/employer_auth_contact_information_controller.dart';

class EmployerAuthContactInformationView
    extends GetView<EmployerAuthContactInformationController> {
  const EmployerAuthContactInformationView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8.0),
          child: SafeArea(child: LeadingButtonAppbar(text: 'Contact Information')),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Contact Information',
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff101010),
                ),
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Upload Company Logo'),
              SizedBox(height: 12.h),
              Center(
                child: Obx(() {
                  return GestureDetector(
                    onTap: () => controller.pickImage(),
                    child: controller.selectedImage.value == null
                        ? Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Color(0xffF2F2F2),
                              border: Border.all(color: Colors.grey, width: 1.w),
                            ),
                            child: Column(
                              children: [
                                Image.asset(ImagePath.fileIcone),
                                SizedBox(height: 5.h),
                                Text("Drop file or browse"),
                                SizedBox(height: 5.h),
                                Text("Format: .jpeg, .png | Max file size: 25MB"),
                              ],
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.file(
                              controller.selectedImage.value!,
                              height: 120.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                  );
                }),
              ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Phone number'),
              SizedBox(height: 12.h),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: controller.phoneController,
                decoration: InputDecoration(hintText: 'Enter phone number'),
              ),
              // SizedBox(height: 16.h),
              // SignUpTitleSmall(text: 'Email'),
              // SizedBox(height: 12.h),
              // TextFormField(
              //   keyboardType: TextInputType.emailAddress,
              //   controller: controller.emailController,
              //   decoration: InputDecoration(hintText: 'Enter email'),
              // ),
              SizedBox(height: 16.h),
              SignUpTitleSmall(text: 'Company Website'),
              SizedBox(height: 12.h),
              TextFormField(
                controller: controller.websiteController,
                decoration: InputDecoration(hintText: 'Enter company website'),
              ),
              SizedBox(height: 16.h),
              Obx((){
                return controller.isLoading.value
                    ? Center(child: SpinKitWave(
                  color: Colors.green,
                  size: 40,
                ))
                    : CustomButton(
                  text: 'Continue',
                  onTap: () {
                    controller.submitContactInfo();
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
