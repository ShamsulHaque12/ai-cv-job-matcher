import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jobly_ai/features/job_seekers/seekers_apply_screen/views/successful_screen.dart';
import 'package:open_filex/open_filex.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/seekers_apply_screen_controller.dart';

class SeekersApplyScreenView extends GetView<SeekersApplyScreenController> {
  const SeekersApplyScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: LeadingButtonAppbar(text: "Apply Job"),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              titleText: "Full Name*",
              textEditingController: controller.nameController,
              hintText: "Enter Name",
            ),
            SizedBox(height: 7.h,),
            CustomTextField(
              titleText: "Email*",
              textEditingController: controller.emailController,
              hintText: "Enter Email",
            ),
            SizedBox(height: 7.h,),
            CustomTextField(
              titleText: "Phone Number*",
              textEditingController: controller.phoneController,
              hintText: "Enter Number",
            ),
            SizedBox(height: 10.h,),
            Text("Upload CV",style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: Color(0xFF2C3E50)
            ),),
            SizedBox(height: 7.h,),
            Text("Add your CV/Resume to apply for a job",style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFF2C3E50)
            ),),
            SizedBox(height: 10.h,),
            Obx(() {
              return Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Colors.grey, width: 1.w),
                  color: Colors.white,
                ),
                child: controller.pdfPath.isEmpty
                    ? GestureDetector(
                  onTap: () => controller.pickPdf(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/icon/pdf.png",
                        height: 30.h,
                        width: 30.w,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        "Upload PDF",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        OpenFilex.open(controller.pdfPath.value);
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/icon/pdf.png",
                            height: 30.h,
                            width: 30.w,
                          ),
                          SizedBox(width: 8.w),
                          SizedBox(
                            width: 150.w,
                            child: Text(
                              controller.pdfPath.value.split('/').last,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => controller.removePdf(),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: 10.h,),
            CustomButton(
              onTap: (){
                Get.to(()=>SuccessfulScreen());
              },
              text: "Apply",
              backgroundColor: Color(0xFFE5E7EB),
              textColor: Color(0xFf4B5563),
              borderColor: Colors.transparent,
            ),
          ]
        ),
      ),
    );
  }
}
