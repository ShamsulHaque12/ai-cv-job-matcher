import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../creat_requirment_screen/controllers/creat_requirment_screen_controller.dart';
import '../../creat_requirment_screen/model/get_my_job_post.dart';
import '../../edit_requirment_screen/controllers/edit_requirment_screen_controller.dart';
import '../controllers/all_active_screen_controller.dart';

class AllActiveScreenView extends GetView<AllActiveScreenController> {
  final CreatRequirmentScreenController requirmentScreenController = Get.put(
    CreatRequirmentScreenController(),
  );
  final EditRequirmentScreenController editRequirmentScreenController = Get.put(
    EditRequirmentScreenController(),
  );
  AllActiveScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Obx(() {
                if (requirmentScreenController.activeJobPosts.isEmpty) {
                  return Center(
                    child: Text(
                      "No Jobs Found!",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: requirmentScreenController.activeJobPosts.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final jobs = requirmentScreenController.activeJobPosts[index];
                    return GestureDetector(
                      onLongPress: () => _openBottomSheet(context, index, jobs),
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
                              child: jobs.company?.logo != null && jobs.company!.logo!.isNotEmpty
                                  ? Image.network(
                                '${Urls.url}${jobs.company!.logo}',
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
                                    jobs.title ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    jobs.company!.companyName ?? "",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    jobs.location ?? "",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
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
                                    jobs.status ?? "",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  "\$${jobs.salaryRange}k",
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
                );
              }),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }

  void _openBottomSheet(BuildContext context, int index, JobData job) {
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
                leading: Icon(Icons.edit, color: Colors.blue),
                title: Text("Edit Job"),
                onTap: () {
                  Get.back();
                  Get.toNamed(Routes.EDIT_POST_SCREEN, arguments: job);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete, color: Colors.red),
                title: Text("Delete Job"),
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
