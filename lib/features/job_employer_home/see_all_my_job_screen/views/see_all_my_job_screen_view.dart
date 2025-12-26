import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../creat_requirment_screen/controllers/creat_requirment_screen_controller.dart';
import '../../creat_requirment_screen/model/get_my_job_post.dart';
import '../../edit_requirment_screen/controllers/edit_requirment_screen_controller.dart';
import '../controllers/see_all_my_job_screen_controller.dart';

class SeeAllMyJobScreenView extends GetView<SeeAllMyJobScreenController> {
  final CreatRequirmentScreenController requirmentScreenController =
  Get.put(CreatRequirmentScreenController());
  final EditRequirmentScreenController editRequirmentScreenController =
  Get.put(EditRequirmentScreenController());

  SeeAllMyJobScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 ScrollController for pagination
    final ScrollController scrollController = ScrollController();

    // Scroll listener
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        requirmentScreenController.getMyJobVacancies(loadMore: true);
      }
    });

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: const SafeArea(child: LeadingButtonAppbar()),
      ),
      body: Obx(() {
        if (requirmentScreenController.isLoading.value &&
            requirmentScreenController.myJobPosts.isEmpty) {
          return Center(
            child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
              size: 40.sp,
              duration: Duration(seconds: 3),
            ),
          );
        }

        if (requirmentScreenController.myJobPosts.isEmpty) {
          return Center(
            child: Text(
              "No Jobs Found!",
              style: TextStyle(fontSize: 14.sp),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await requirmentScreenController.getMyJobVacancies();
          },
          child: ListView.separated(
            controller: scrollController,
            padding: EdgeInsets.all(20),
            itemCount: requirmentScreenController.myJobPosts.length +
                (requirmentScreenController.isLoadingMore.value ? 1 : 0),
            separatorBuilder: (_, __) => SizedBox(height: 12.h),
            itemBuilder: (context, index) {
              // 🔄 Loading Indicator for last index
              if (index >= requirmentScreenController.myJobPosts.length) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              final job = requirmentScreenController.myJobPosts[index];

              return GestureDetector(
                onLongPress: () => _openBottomSheet(context, job),
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: job.company?.logo != null && job.company!.logo!.isNotEmpty
                            ? Image.network(
                          '${Urls.url}${job.company!.logo}',
                          height: 60.h,
                          width: 70.w,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Image.asset(
                            'assets/icons/avatar.png',
                            height: 60.h,
                            width: 70.w,
                            fit: BoxFit.cover,
                          ),
                        )
                            : Image.asset(
                          'assets/icons/avatar.png',
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
                              job.title ?? "",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2C3E50),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              job.company?.companyName ?? "Unknown Company",
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2C3E50),
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              job.location ?? "Location not specified",
                              style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              job.status ?? "N/A",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.green,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            job.salaryRange != null
                                ? "\$${job.salaryRange}k"
                                : "N/A",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      }),
    );
  }

  void _openBottomSheet(BuildContext context, JobData job) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 50,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: const Text("Edit Job"),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.EDIT_POST_SCREEN, arguments: job);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: const Text("Delete Job"),
                onTap: () {
                  Get.back();
                  editRequirmentScreenController.deletePost(job.id!);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
