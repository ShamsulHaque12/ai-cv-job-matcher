
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_text_style.dart';
import '../../../common/custom_button.dart';
import '../../../theme/image_path.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../../common/sign_up_title_small.dart';
import '../controllers/auth_upload_resume_controller.dart';

class AuthUploadResumeView extends GetView<AuthUploadResumeController> {
  const AuthUploadResumeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LeadingButtonAppbar(text: 'Upload Resume'),
              SizedBox(height: 25.h),
              Text(
                "Upload Resume",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff2C3E50),
                ),
              ),
              const SizedBox(height: 4),
              SignUpTitleSmall(
                text: 'Please take a photo or upload your Resume',
              ),
              SizedBox(height: 20.h),
              // Upload Box
              DottedBorder(
                options: RoundedRectDottedBorderOptions(
                  color: Color(0xffD1D6DB),
                  dashPattern: [6, 3],
                  radius: Radius.circular(14.r),
                ),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Image.asset(
                        ImagePath.uploadResumeIcon,
                        width: 32.w,
                        height: 32.h,
                      ),
                      Text(
                        "Upload Resume",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff2C3E50),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "Supports: PDF, DOC, DOCX • Max 10MB",
                        style: GoogleFonts.inter(
                          color: Color(0xff4B5563),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: controller.takePhoto,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.grey.shade400),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text(
                              "Take Photo",
                              style: AppTextStyle.interSmallTitle.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          OutlinedButton(
                            onPressed: controller.pickFile,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.grey.shade400),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                            child: Text(
                              "Choose File",
                              style: AppTextStyle.interSmallTitle.copyWith(
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20.h),
              // Uploaded File Box
              Obx(() {
                if (controller.selectedFile.value == null) {
                  return const SizedBox.shrink();
                }

                IconData icon = controller.fileType.value == 'photo'
                    ? Icons.image
                    : Icons.picture_as_pdf;

                return DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: Color(0xffD1D6DB),
                    dashPattern: [6, 3],
                    radius: Radius.circular(14.r),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0xff3F13E4).withAlpha(5),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(icon, color: Colors.red, size: 40.sp),
                            SizedBox(width: 14.w),
                            Expanded(
                              child: Text(
                                "${controller.fileName.value}\n${controller.fileSize.value}",
                                style: TextStyle(fontSize: 14.sp),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        GestureDetector(
                          onTap: controller.removeFile,
                          child: Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                  size: 22,
                                ),
                              ),
                              Text(
                                'Remove file',
                                style: AppTextStyle.interSmallTitle.copyWith(
                                  fontSize: 12.sp,
                                  color: Color(0xffFF4D4F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              SizedBox(height: 25.h),
              // Start Matching Button
              CustomButton(
                text: 'Start Matching',
                radius: 8,
                onTap: () async {
                  if (controller.selectedFile.value != null) {
                    Get.snackbar(
                      'Success',
                      'Resume uploaded successfully',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: AppColors.primaryColor,
                      colorText: Colors.white,
                    );
                   await controller.uploadFileToAI();
                  } else {
                    Get.snackbar(
                      'Error',
                      'Please upload your resume first',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
              ),
              SizedBox(height: 25.h),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xffF3F4F6)),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Privacy Note: ',
                        style: AppTextStyle.interSmallTitle.copyWith(
                          fontSize: 12.sp,
                          color: Color(0xff6B7280),
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text:
                                'Your resume is private—used only for matching and never shared.',
                            style: AppTextStyle.interSmallTitle.copyWith(
                              fontSize: 12.sp,
                              color: Color(0xff6B7280),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
