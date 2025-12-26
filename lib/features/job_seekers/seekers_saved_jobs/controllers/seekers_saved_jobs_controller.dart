
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../model/job_favourite_model.dart';

class SeekersSavedJobsController extends GetxController {
  RxList<FavoriteModel> savedJobs = <FavoriteModel>[].obs;
  final isLoading = false.obs;

  Future<void> getSavedJobs() async {
    try {
      isLoading.value = true;
      NetworkResponse response = await NetworkCaller().getRequest(
        url: Urls.getSaveJobs,
      );
      if (response.isSuccess) {
        final data = response.responseData?["data"] as List;
        savedJobs.clear();
        savedJobs.assignAll(
          data.map<FavoriteModel>((e) => FavoriteModel.fromJson(e)).toList(),
        );
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  void showSnackBar(bool success, String? message) {
    if (Get.isSnackbarOpen) {
      Get.closeCurrentSnackbar();
    }
    Get.snackbar(
      success ? "Success" : "Error",
      message ?? "",
      snackPosition: SnackPosition.TOP,
      backgroundColor: success ? Colors.green : Colors.red,
          colorText: Colors.white,
    );
  }
  void toggleFavorite(BuildContext context, int index) {
    var job = savedJobs[index];
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
      ),
      builder: (_) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40.w,
                  height: 5.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              /// ✅ This Job Info will show in bottomsheet
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
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child:
                          (job.job?.company?.logo != null &&
                              job.job!.company!.logo!.isNotEmpty &&
                              job.job!.company!.logo!.startsWith("http"))
                          ? FadeInImage.assetNetwork(
                              placeholder: "assets/images/default_image.jpg",
                              image: job.job!.company!.logo!,
                              height: 60.h,
                              width: 70.w,
                              fit: BoxFit.cover,
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/images/default_image.jpg",
                                  height: 60.h,
                                  width: 70.w,
                                  fit: BoxFit.cover,
                                );
                              },
                            )
                          : Image.asset(
                              "assets/images/default_image.jpg",
                              height: 60.h,
                              width: 70.w,
                              fit: BoxFit.cover,
                            ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            job.job?.title ?? "",
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
                            job.job?.experience ?? "",
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
                                job.job?.location ?? "",
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
                                job.job?.jobType ?? "",
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
                    Text(
                      job.job?.salaryRange ?? "",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Text(
                "Remove from favorites?",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10.h),
              Text(
                "This job will no longer show in your favorite list.",
                style: TextStyle(fontSize: 14.sp, color: Colors.grey),
              ),
              SizedBox(height: 15.h),

              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: (){
                        Get.back();
                      },
                      child: Text("Cancel"),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Get.back();
                        try {
                          NetworkResponse response = await NetworkCaller()
                              .deleteRequest(
                            url: Urls.deleteSaveJobs(job.job?.id ?? ''),
                          );
                          if (response.isSuccess) {
                            final message = response.responseData?['message'];
                            showSnackBar(true, message);
                            await getSavedJobs();
                          } else {
                            final message =
                                response.responseData?['message'] ?? "Failed to delete";
                            showSnackBar(false, message);
                          }
                        } catch (e) {
                          showSnackBar(false, e.toString());
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: Text("Remove"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        );
      },
    );
  }
}
