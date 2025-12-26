import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../home_screen/controllers/job_seekers_home_screen_controller.dart';
import '../../seekers_saved_jobs/controllers/seekers_saved_jobs_controller.dart';
import '../controllers/job_seekers_search_controller.dart';

class JobSeekersSearchView extends GetView<JobSeekersSearchController> {
   JobSeekersSearchView({super.key});
  final favoriteJobsController = Get.find<SeekersSavedJobsController>();
  final homeController = Get.find<JobSeekersHomeScreenController>();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Search'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search field
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: controller.onSearchChanged,
                    decoration: InputDecoration(
                      hintText: "Search...",
                      hintStyle: GoogleFonts.inter(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF2C3E50)),
                      suffixIcon:
                      const Icon(Icons.search, color: Color(0xFF64748B)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: const BorderSide(color: Color(0xFFD1D6DB)),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(
                            color: Color(0xFFD1D6DB),
                            width: 1,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.r),
                          borderSide: const BorderSide(
                            color: Color(0xFFD1D6DB),
                            width: 1,
                          )),
                      filled: true,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.all(16.0),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                GestureDetector(
                  onTap: () {
                    controller.toggleFavorite(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Colors.transparent,
                        border: Border.all(
                          color: const Color(0xFFD1D6DB),
                          width: 1,
                        )),
                    child: Image.asset('assets/icon/filter.png'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Dynamic content (Suggestions or Job results)
            Expanded(
              child: Obx(() {
                if (controller.jobFilterIsloading.value) {
                  return Center(child: SpinKitFadingCircle(
                    color: AppColors.primaryColor,
                    size: 50.sp,
                    duration: const Duration(seconds: 3),
                  ));
                }
                if (controller.suggestions.isEmpty &&
                    controller.filteredJobs.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/find_jobs.png'),
                        SizedBox(height: screenHeight * 0.06),
                        Text(
                          'No results found',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff2C3E50),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'The search could not be found, please check spelling or write another word.',
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            color: const Color(0xff524B6B),
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }

                if (controller.filteredJobs.isEmpty &&
                    controller.suggestions.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Suggestions',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.suggestions.length,
                          itemBuilder: (context, index) {
                            final item = controller.suggestions[index];
                            return ListTile(
                              leading: const Icon(Icons.search),
                              title: Text(item),
                              onTap: () {
                                controller.onSuggestionTap(item);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }

                // 🔹 Filtered Job Results
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Results ',
                        style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2C3E50))),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.filteredJobs.length,
                        itemBuilder: (context, index) {
                          final job = controller.filteredJobs[index];
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Get.toNamed(
                                Routes.SEEKERS_JOB_DETAILS_SCREEN,
                                arguments: job.id,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.w, horizontal: 8.h),
                              margin: EdgeInsets.symmetric(vertical: 6.h),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Color(0xFFF3F4F6)),
                                borderRadius: BorderRadius.circular(8.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha(5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Image.asset('assets/images/post1.png',
                                      width: 64.w, height: 64.h),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(job.title ?? '',
                                            style: GoogleFonts.inter(
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff2C3E50))),
                                        Text(job.company?.companyName ?? '',
                                            style: GoogleFonts.inter(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w600,
                                                color: const Color(0xff4B5563))),
                                        Text(
                                            '${job.location ?? "-"} - ${job.workArrangement ?? "-"}',
                                            style: GoogleFonts.inter(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xff4B5563))),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Obx((){
                                        final isSave = favoriteJobsController.savedJobs.any((saveJobs)=> saveJobs.jobId.toString() == job.id.toString());
                                        return GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () {
                                            controller.saveJobs(job.id);
                                          },
                                          child: Icon(isSave ? Icons.favorite : Icons.favorite_border,
                                              color: AppColors.primaryColor),
                                        );
                                      }),
                                      SizedBox(height: 10.h),
                                      Text(job.salaryRange ?? '',
                                          style: GoogleFonts.inter(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12.sp,
                                              color: const Color(0xff1E3A8A))),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
