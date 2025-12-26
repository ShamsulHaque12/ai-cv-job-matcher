
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/application_detail_screens_controller.dart';

class ApplicationDetailScreensView
    extends GetView<ApplicationDetailScreensController> {
   ApplicationDetailScreensView({super.key});
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final application = Get.arguments;
    String deadline = application.appliedDate.toString();
    String onlyDate = deadline.split('T')[0];
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
                        child: Image.network(
                          '${Urls.url}${application.logo}',
                          height: 60.h,
                          width: 70.w,
                          fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset(
                                'assets/images/default_image.jpg',
                                width: 50.w,
                                height: 50.w,
                                fit: BoxFit.cover,
                              );
                            }
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              application.position,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2C3E50),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              application.companyName,
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
                    text: application.status,
                    backgroundColor: (application.status == "PENDING")
                        ? Color(0xFFF59E0B).withOpacity(0.15)
                        : (application.status == "REJECTED")
                        ? Color(0xFFDC2626).withOpacity(0.15)
                        : (application.status == "SELECTED")
                        ? Color(0xFF16A34A).withOpacity(0.15)
                        : Colors.grey.withOpacity(0.15),
                    textColor: (application.status == "PENDING")
                        ? Color(0xFFF59E0B)
                        : (application.status == "REJECTED")
                        ? Color(0xFFDC2626)
                        : (application.status == "SELECTED")
                        ? Color(0xFF16A34A)
                        : Colors.grey,
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
                Text(application.salaryRange,style: GoogleFonts.inter(
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
                Text(application.jobType,style: GoogleFonts.inter(
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
                Text("Company Name: ",style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C3E50)
                ),),
                Text(application.companyName,style: GoogleFonts.inter(
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
                Text("Company Contact: ",style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C3E50)
                ),),
                Text(application.companyContact,style: GoogleFonts.inter(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Applied Date: ",style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C3E50)
                ),),

                Text(onlyDate,style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E3A8A)
                ))
              ],
            ),
            SizedBox(height: screenHeight * 0.2,),
           /* Divider(
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
              maxLines: 6,
              borderSide: BorderSide(
                color: Colors.grey.shade300,
                width: 1.w,
              ),
            ),
            SizedBox(height: 15.h,),*/
            CustomButton(
              height: 35.h,
              onTap: () {
              Get.back();
              },
              text: application.status == 'REJECTED'? "Discover another job": application.status == 'SELECTED'? "Scheduled for Interview":'Waiting for review',
              backgroundColor:application.status == 'REJECTED' ? AppColors.primaryColor:application.status == 'SELECTED'? AppColors.primaryColor:Color(0xffE5E7EB),
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
