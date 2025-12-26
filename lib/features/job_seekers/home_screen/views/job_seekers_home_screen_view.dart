
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../bottom_navbar_screen/controllers/job_seekers_bottom_navbar_screen_controller.dart';
import '../../seekers_applications_screen/controllers/seekers_applications_screen_controller.dart';
import '../../seekers_profile_screen/controllers/seekers_profile_screen_controller.dart';
import '../../seekers_saved_jobs/controllers/seekers_saved_jobs_controller.dart';
import '../controllers/job_seekers_home_screen_controller.dart';
import '../widget/featuers_list.dart';
import '../widget/job_card.dart';

class JobSeekersHomeScreenView extends GetView<JobSeekersHomeScreenController> {
  JobSeekersHomeScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final profileInfoController =
        Get.find<JobSeekersBottomNavbarScreenController>();
    final profileUpdate = Get.find<SeekersProfileScreenController>();
    final favoriteJobsController = Get.find<SeekersSavedJobsController>();
    final appliedJobs = Get.find<SeekersApplicationsScreenController>();
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12.w),
          child: Obx(() {
            final user = profileInfoController.profileInfo.value;
            final localFile = profileUpdate.pickedImage.value;

            ImageProvider avatarImage;

            if (localFile != null) {
              // Local file picked
              avatarImage = FileImage(localFile);
            } else if (user?.profilePic != null && user!.profilePic!.isNotEmpty) {
              final pic = user.profilePic;

              // Check if URL is Google full URL (starts with http)
              if (pic!.startsWith("http")) {
                avatarImage = NetworkImage(pic);
              } else {
                // Backend relative path
                avatarImage = NetworkImage('${Urls.url}$pic');
              }
            } else {
              // Default avatar
              avatarImage = const AssetImage('assets/icon/avatar.png');
            }

            return CircleAvatar(
              backgroundColor: const Color(0xFF1E3A8A).withAlpha(10),
              radius: 40,
              backgroundImage: avatarImage,
            );
          })
        ),
        title: Obx(() {
          final user = profileInfoController.profileInfo.value;
          return Text(
            "Hello, ${user?.fullName ?? ""}!",
            style: GoogleFonts.inter(
              fontSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF000000),
            ),
          );
        }),
        actions: [
          GestureDetector(
            onTap: () {
              Get.toNamed(Routes.JOB_SEEKERS_NOTIFICATION);
            },
            child: Container(
              height: 40.h,
              width: 45.w,
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Color(0xff1E3A8A).withAlpha(10),
              ),
              child: Icon(Icons.notifications, color: Color(0xff1E3A8A)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _SearchBar(),
              SizedBox(height: 14.h),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.JOB_SEEKERS_TIPS_FOR_YOU);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tips for you",
                      style: GoogleFonts.inter(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2C3E50),
                      ),
                    ),
                    Text(
                      "See all",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF000000), Color(0xFF1E3A8A)],
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                        top: 16.h,
                        bottom: 0
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "How to Find a\nperfect job for you",
                                style: GoogleFonts.inter(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 14.h),
                              Container(
                                margin: EdgeInsets.only(bottom: 25),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 8.h),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child: Text(
                                  "Read more",
                                  style: GoogleFonts.inter(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF1E3A8A),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Right side girl image
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              "assets/images/female.png",
                              height: 122.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              /* Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Suggestion jobs",
                    style: GoogleFonts.inter(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                  Text(
                    "View All",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),*/
              /*  Obx(() {
                final jobs = controller.visibleJobs;
                return SizedBox(
                  height: 187.h,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemCount: jobs.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return JobCard(
                        job: job,
                        isFav: controller.favorites.contains(job['id'] ?? -1),
                        onHeartTap: () =>
                            controller.toggleFavorite(job['id'] ?? -1),
                        onApply: () => controller.applyToJob(job['id'] ?? -1),
                      );
                    },
                  ),
                );
              }),
              SizedBox(height: 8.h),*/
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured jobs",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2C3E50),
                    ),
                  ),
                ],
              ),
              Obx(() {
                final jobs = controller.jobs;
                if (controller.isLoading.value && controller.jobs.isEmpty) {
                  return Center(child: SpinKitFadingCircle(
                    color: AppColors.primaryColor,
                    size: 50.sp,
                    duration: const Duration(seconds: 3),
                  ));
                }
                if (jobs.isEmpty && controller.isLoading.value) {
                  return const Center(child: Text("No jobs found"));
                }

                return ListView.separated(
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: jobs.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final profilePic = jobs[index].user?.profilePic;
                    final isApplyed = appliedJobs.jobApplication.any(
                      (savedJob) =>
                          savedJob.jobId.toString() ==
                          controller.jobs[index].id.toString(),
                    );
                    return Obx(
                      () => Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.fromLTRB(14, 18, 14, 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff8E8DD0).withAlpha(16),
                              blurRadius: 8,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.r),
                                  child:
                                      profilePic != null &&
                                          profilePic.isNotEmpty
                                      ? Image.network(
                                          '${Urls.url}$profilePic',
                                          width: 50.w,
                                          height: 50.w,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.asset(
                                          'assets/images/find_jobs.png',
                                          width: 50.w,
                                          height: 50.w,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        jobs[index].title.toString(),
                                        style: GoogleFonts.inter(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff212121),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        jobs[index].company?.companyName ?? '',
                                        style: GoogleFonts.inter(
                                          color: Color(0xff8A8894),
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Obx(() {
                                      final saving = favoriteJobsController.savedJobs.any((savedJob) => savedJob.jobId.toString() == controller.jobs[index].id.toString(),
                                          );

                                      return GestureDetector(
                                        behavior: HitTestBehavior.opaque,
                                        onTap: () {
                                          controller.saveJobs(jobs[index].id);
                                        },
                                        child: SizedBox(
                                          width: 28.w,
                                          height: 28.h,
                                          child: Center(
                                            child: Icon(
                                              saving
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: AppColors.primaryColor,
                                              size: 18.sp,
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12.h),
                            Text(
                              jobs[index].salaryRange.toString(),
                              style: GoogleFonts.inter(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14.sp,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 14.sp,
                                  color: Color(0xff64748B),
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    jobs[index].location.toString(),
                                    style: TextStyle(
                                      color: Color(0xff4B5563),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            CustomButton(
                              text:isApplyed? 'Applied':'Apply Now',
                              onTap: () {
                                Get.toNamed(
                                  Routes.SEEKERS_JOB_DETAILS_SCREEN,
                                  arguments: jobs[index].id,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _SearchBar() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            onTap: () {
              Get.toNamed(Routes.JOB_SEEKERS_SEARCH);
            },
            readOnly: true,
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: GoogleFonts.inter(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFF2C3E50),
              ),
              suffixIcon: Icon(Icons.search, color: Color(0xFF64748B)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Color(0xFFD1D6DB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Color(0xFFD1D6DB), width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide(color: Color(0xFFD1D6DB), width: 1),
              ),
              filled: true,
              fillColor: Colors.transparent,
              contentPadding: EdgeInsets.all(16.0),
            ),
          ),
        ),
/*        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: Color(0xFFD1D6DB), width: 1),
          ),
          child: Image.asset('assets/icon/filter.png'),
        ),*/
      ],
    );
  }
}
