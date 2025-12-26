import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/seekers_saved_jobs_controller.dart';

class SeekersSavedJobsView extends GetView<SeekersSavedJobsController> {
  const SeekersSavedJobsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: LeadingButtonAppbar(text: "Favourite Jobs"),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Obx(() {
          if(controller.isLoading.value){
            return Center(
              child: SpinKitFadingCircle(
                color: AppColors.primaryColor,
                size: 50.sp,
                duration: const Duration(seconds: 3),
              ),
            );
          }
          if (controller.savedJobs.isEmpty) {
            return Center(
              child: Text(
                "Not save favorite jobs yet...",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                ),
              ),
            );
          }
          return ListView.separated(
            itemCount: controller.savedJobs.length,
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              final saveJob = controller.savedJobs[index];
              return Container(
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
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child:
                      saveJob.job?.company?.logo != null ? Image.network(
                        '${Urls.url}${saveJob.job?.company?.logo}',
                        width: 50.w,
                        height: 50.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            'assets/images/default_image.jpg',
                            width: 50.w,
                            height: 50.w,
                            fit: BoxFit.cover,
                          );
                        },
                      )
                          : Image.asset(
                        'assets/images/default_image.jpg',
                        width: 50.w,
                        height: 50.w,
                        fit: BoxFit.cover,
                      ),
                    )
                    ,
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            saveJob.job?.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2C3E50),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            saveJob.job?.experience ?? "",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF6B7280),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Text(
                                saveJob.job?.location ?? "",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF2C3E50),
                                ),
                              ),
                              SizedBox(width: 5.h),
                              const Text("-"),
                              SizedBox(width: 5.h),
                              Text(
                                saveJob.job?.jobType ?? "",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                             controller.toggleFavorite(context, index);
                          },
                          child: Icon(
                             Icons.delete,
                            size: 24.sp,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          saveJob.job?.salaryRange ?? "",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF6B7280),
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
      ),
    );
  }
}
