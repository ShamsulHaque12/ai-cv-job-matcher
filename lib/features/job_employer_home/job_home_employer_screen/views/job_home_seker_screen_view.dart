
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_stat_card.dart';
import '../../../employer_auth/auth/company_information/controllers/employer_auth_company_information_controller.dart';
import '../../creat_requirment_screen/controllers/creat_requirment_screen_controller.dart';
import '../../creat_requirment_screen/model/get_my_job_post.dart';
import '../../edit_employer_profile/controllers/edit_employer_profile_controller.dart';
import '../../edit_requirment_screen/controllers/edit_requirment_screen_controller.dart';
import '../controllers/job_home_seker_screen_controller.dart';

class JobHomeSekerScreenView extends GetView<JobHomeSekerScreenController> {
  final CreatRequirmentScreenController requirmentScreenController = Get.put(
    CreatRequirmentScreenController(),
  );
  final EditRequirmentScreenController editRequirmentScreenController = Get.put(
    EditRequirmentScreenController(),
  );
  final EditEmployerProfileController editEmployerProfileController = Get.put(
    EditEmployerProfileController(),
  );
  final EmployerAuthCompanyInformationController
  employerAuthCompanyInformationController = Get.put(
    EmployerAuthCompanyInformationController(),
  );
  JobHomeSekerScreenView({super.key});
  @override
  Widget build(BuildContext context) {

    return Obx(() {
      if (employerAuthCompanyInformationController.showNoCompanyPopup.value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _showFirstLoginPopup(context);
          employerAuthCompanyInformationController.showNoCompanyPopup.value =
              false;
        });
      }
      return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: Obx(() {
              final String profilePic =
                  editEmployerProfileController
                      .showMe
                      .value
                      ?.data
                      ?.profilePic ??
                  '';

              final String imageUrl = profilePic.isNotEmpty
                  ? '${Urls.url}$profilePic'
                  : '';

              return CircleAvatar(
                radius: 30.r,
                backgroundImage: imageUrl.isNotEmpty
                    ? NetworkImage(imageUrl)
                    : const AssetImage("assets/images/post1.png")
                          as ImageProvider,
                onBackgroundImageError: (_, __) {},
              );
            }),
          ),
          title: Row(
            children: [
              Text(
                "Welcome,",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 10.w),
              Text(
                editEmployerProfileController.showMe.value?.data?.firstName ??
                    "",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondaryColor,
                ),
              ),
            ],
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.JOB_EMPLOYER_NOTIFICATION_SCREEN);
              },
              child: Container(
                height: 35.h,
                width: 40.w,
                margin: EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0x1A1E3A8A),
                  shape: BoxShape.rectangle,
                ),
                child: Icon(Icons.notifications),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Overview",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.titleTextColor,
                ),
              ),
              SizedBox(height: 15.h),
              Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primaryColor,
                      size: 40.sp,
                      duration: Duration(seconds: 3),
                    ),
                  );
                }

                final stats = controller.dashboardData.value?.stats;

                return GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.2,
                  children: [
                    CustomStatCard(
                      title: "Total Jobs",
                      value: stats?.totalJobs ?? 0,
                    ),
                    CustomStatCard(
                      title: "Candidates",
                      value: stats?.totalCandidates ?? 0,
                    ),
                    CustomStatCard(
                      title: "Active Jobs",
                      value: stats?.totalActiveJobs ?? 0,
                    ),
                  ],
                );
              }),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Post",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleTextColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SEE_ALL_MY_JOB_SCREEN);
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.titleTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Obx(() {
                final dashboard = controller.dashboardData.value;

                if (dashboard == null) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primaryColor,
                      size: 40.sp,
                    ),
                  );
                }

                if (dashboard.recentJobs.isEmpty) {
                  return Center(
                    child: Text(
                      "No Jobs Found!",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  );
                }

                final jobs = dashboard.recentJobs;

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: jobs.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final job = jobs[index];

                    return GestureDetector(
                      onLongPress: () {
                        // optional bottom sheet
                      },
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
                            /// LEFT IMAGE
                            Obx(() {
                              final String profilePic =
                                  editEmployerProfileController
                                      .showMe
                                      .value
                                      ?.data
                                      ?.profilePic ??
                                      '';

                              final String imageUrl = profilePic.isNotEmpty
                                  ? '${Urls.url}$profilePic'
                                  : '';

                              return CircleAvatar(
                                radius: 30.r,
                                backgroundImage: imageUrl.isNotEmpty
                                    ? NetworkImage(imageUrl)
                                    : const AssetImage("assets/images/post1.png")
                                as ImageProvider,
                                onBackgroundImageError: (_, __) {},
                              );
                            }),

                            SizedBox(width: 12.w),

                            /// MIDDLE CONTENT
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
                                      color: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  Text(
                                    job.jobIndustry ?? "Company",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF2C3E50),
                                    ),
                                  ),
                                  SizedBox(height: 3.h),
                                  Text(
                                    job.location ?? "",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            /// RIGHT SIDE
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
                                    job.status ?? "Active",
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  job.salaryRange ?? "",
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

              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Applied",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.titleTextColor,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.SEE_ALL_APPLIED_POST);
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.titleTextColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Obx(() {
                final dashboard = controller.dashboardData.value;

                if (dashboard == null) {
                  return Center(
                    child: SpinKitFadingCircle(
                      color: AppColors.primaryColor,
                      size: 40.sp,
                    ),
                  );
                }

                if (dashboard.recentCandidates.isEmpty) {
                  return Center(
                    child: Text(
                      "No Recent Candidates Found!",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  );
                }

                final recentCandidates = dashboard.recentCandidates;

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recentCandidates.length,
                  separatorBuilder: (_, __) => SizedBox(height: 12.h),
                  itemBuilder: (context, index) {
                    final candidate = recentCandidates[index];
                    final seeker = candidate.jobSeeker;
                    final job = candidate.job;

                    return Container(
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // IMAGE + NAME + JOB TITLE
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 25.r,
                                backgroundImage:
                                    seeker?.profilePic != null &&
                                        seeker!.profilePic!.isNotEmpty
                                    ? NetworkImage(
                                        "${Urls.url}${seeker.profilePic}",
                                      )
                                    : AssetImage("assets/icon/avatar.png")
                                          as ImageProvider,
                              ),
                              SizedBox(width: 12.w),
                              // Candidate info
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${seeker?.firstName ?? ''} ${seeker?.lastName ?? ''}",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF2C3E50),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      job?.title ?? 'N/A',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 12.w),
                              // Row(
                              //   children: [
                              //     GestureDetector(
                              //       onTap: () {
                              //       },
                              //       child: Container(
                              //         height: 40.h,
                              //         width: 40.w,
                              //         padding: EdgeInsets.all(6),
                              //         decoration: BoxDecoration(
                              //           borderRadius: BorderRadius.circular(10.r),
                              //           color: Color(0x1A1E3A8A),
                              //         ),
                              //         child: Image.asset("assets/icon/phone.png"),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
                          ),

                          SizedBox(height: 10.h),
                          Divider(thickness: 1.h),
                          SizedBox(height: 10.h),

                          // Buttons bottom
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: CustomButton(
                                  height: 30.h,
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.SHOW_RESUME_SCREEN,
                                      arguments: seeker,
                                    );
                                  },
                                  text: "View Profile",
                                  radius: 10,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: CustomButton(
                                  height: 30.h,
                                  onTap: () {
                                    Get.toNamed(
                                      Routes.RESUME_DETAILS_SCREEN,
                                      arguments: {
                                        "seeker": seeker,
                                        "job": job,
                                        "candidate": candidate.id,
                                      },
                                    );
                                  },
                                  text: "Details",
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
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );
    });
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

  void _showFirstLoginPopup(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // ====== Main Heading ======
              Text(
                "Create Your Company First!",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),

              // ====== Description ======
              Text(
                "Before you can post a job, you need to create your company profile. "
                "This will allow you to manage job postings and applications.",
                style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),

              // ====== Buttons ======
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text("Skip", style: TextStyle(color: Colors.black)),
              ),

              // Create Company Button
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  Get.toNamed(Routes.EMPLOYER_AUTH_COMPANY_INFORMATION);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                child: Text(
                  "Create Company",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
