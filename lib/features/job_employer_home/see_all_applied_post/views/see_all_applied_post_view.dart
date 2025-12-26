import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/see_all_applied_post_controller.dart';

class SeeAllAppliedPostView extends GetView<SeeAllAppliedPostController> {
  const SeeAllAppliedPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: const SafeArea(child: LeadingButtonAppbar()),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
              size: 40.sp,
              duration: Duration(seconds: 3),
            ),
          );
        }

        if (controller.appliedJobPosts.isEmpty) {
          return Center(
            child: Text(
              "No jobs found!",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey),
            ),
          );
        }

        /// ✅ Safe ListView
        return ListView.separated(
          padding: EdgeInsets.all(20.w),
          itemCount: controller.appliedJobPosts.length,
          separatorBuilder: (_, __) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final appliedJob = controller.appliedJobPosts[index];
            final job = appliedJob.job;
            final company = job?.company;
            final seeker = appliedJob.jobSeeker;

            return Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.05),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ✅ IMAGE + TITLE + ICON
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        backgroundImage: seeker?.profilePic != null && seeker!.profilePic!.isNotEmpty
                            ? NetworkImage("${Urls.url}${seeker.profilePic}")
                            : AssetImage("assets/icons/avatar.png") as ImageProvider,
                      ),
                      SizedBox(width: 12.w),

                      /// Title + Subtitle
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              seeker?.fullName ?? "Unknown Candidate",
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              job?.title ?? "Untitled Job",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2C3E50),
                              ),
                            ),

                          ],
                        ),
                      ),

                      /// Phone Icon
                      GestureDetector(
                        onTap: () {
                          controller.makePhoneCall(company?.phoneNumber ?? "");
                        },
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0x1A1E3A8A),
                          ),
                          child: Image.asset("assets/icons/phone.png"),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),
                  Divider(thickness: 0.8.h),
                  SizedBox(height: 10.h),

                  /// ✅ Buttons
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          height: 35.h,
                          onTap: () {
                            Get.toNamed(Routes.SHOW_RESUME_SCREEN);
                          },
                          text: "See Resume",
                          radius: 10,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: CustomButton(
                          height: 35.h,
                          onTap: () {
                            Get.toNamed(
                              Routes.RESUME_DETAILS_SCREEN,
                              arguments: {
                                "seeker": seeker,
                                "job": job,
                                "candidate": appliedJob.id,
                              },
                            );

                          },
                          text: "See Details",
                          radius: 10,
                          backgroundColor: Colors.white,
                          textColor: Colors.black,
                          borderWidth: 1,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
