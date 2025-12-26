import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/application_detail_screens_controller.dart';

class RejectedScreen extends StatelessWidget {
  final ApplicationDetailScreensController controller = Get.put(ApplicationDetailScreensController());
  RejectedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final application = Get.arguments;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar(text: "Application",)),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          application.image,
                          height: 60.h,
                          width: 70.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              application.title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              application.subTitle,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Divider(thickness: 1, color: Colors.grey.shade300),
                  SizedBox(height: 5.h),
                  CustomButton(
                    height: 35.h,
                    onTap: () {

                    },
                    text: "Rejected",
                    backgroundColor: Color(0xFFDC2626).withOpacity(0.15),
                    textColor: Color(0xFFDC2626),
                    borderColor: Colors.transparent,
                    radius: 60.r,
                  ),

                ],
              ),
            ),
            SizedBox(height: 10.h,),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Salary: ",style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C3E50)
                ),),
                Text(application.salary,style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E3A8A)
                ))
              ],
            ),

            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Type: ",style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C3E50)
                ),),
                Text(application.type,style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E3A8A)
                ))
              ],
            ),
            SizedBox(height: 15.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Location: ",style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C3E50)
                ),),
                Text(application.location,style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E3A8A)
                ))
              ],
            ),
            SizedBox(height: 15.h,),
            Divider(
              thickness: 1,
              color: Colors.grey.shade300,
            ),
            SizedBox(height: 10.h,),
            Text("Message*",style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),),
            SizedBox(height: 10.h,),
            CustomTextField(
              textEditingController: controller.interviewController,
              hintText: "Enter your message",
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.w,
              ),
            ),
            SizedBox(height: 15.h,),
            CustomButton(
              height: 35.h,
              onTap: () {

              },
              text: "Discover another job",
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
              borderColor: Colors.transparent,
              radius: 8.r,
            ),
            SizedBox(height: 20.h,),
          ],
        ),
      ),
    );
  }
}
