
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../services/api_endpoints.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../seekers_applications_screen/controllers/seekers_applications_screen_controller.dart';

class PendingScreen extends StatelessWidget {
  final controller = Get.find<SeekersApplicationsScreenController>();
  PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final int index = Get.arguments;
    final application = controller.jobApplication[index]; // AppliedJobModel

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: LeadingButtonAppbar(text: "Application"),
        ),
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
                        child: application.logo != null
                            ? Image.network(
                          '${Urls.url}${application.logo}' ?? '',
                          height: 60.h,
                          width: 70.w,
                          fit: BoxFit.cover,
                        )
                            : Container(
                          height: 60.h,
                          width: 70.w,
                          color: Colors.grey.shade300,
                          child: Icon(Icons.business),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              application.position ?? "N/A",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2C3E50),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              application.companyName ?? "N/A",
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
                    onTap: () {},
                    text: "Pending",
                    backgroundColor: Color(0xFFF59E0B).withOpacity(0.15),
                    textColor: Color(0xFFF59E0B),
                    borderColor: Colors.transparent,
                    radius: 60.r,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            Divider(thickness: 1, color: Colors.grey.shade300),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Salary: ",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2C3E50))),
                Text(application.salaryRange ?? "N/A",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E3A8A))),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Type: ",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2C3E50))),
                Text(application.salaryRange ?? "N/A",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E3A8A))),
              ],
            ),
            SizedBox(height: 15.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Location: ",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF2C3E50))),
                Text(application.location ?? "N/A",
                    style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF1E3A8A))),
              ],
            ),
            SizedBox(height: 15.h),
            Divider(thickness: 1, color: Colors.grey.shade300),
            SizedBox(height: 10.h),
            Text("Message*",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                )),
            SizedBox(height: 10.h),
            CustomTextField(
              hintText: "Enter your message",
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.w,
              ),
            ),
            SizedBox(height: 15.h),
            CustomButton(
              height: 35.h,
              onTap: () {},
              text: "Waiting for review",
              backgroundColor: Color(0xFFE5E7EB),
              textColor: Colors.black,
              borderColor: Colors.transparent,
              radius: 8.r,
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}

