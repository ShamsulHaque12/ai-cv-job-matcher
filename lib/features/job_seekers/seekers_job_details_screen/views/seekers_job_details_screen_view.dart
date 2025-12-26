import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../services/api_endpoints.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../home_screen/controllers/job_seekers_home_screen_controller.dart';
import '../../seekers_saved_jobs/controllers/seekers_saved_jobs_controller.dart';
import '../controllers/seekers_job_details_screen_controller.dart';

class SeekersJobDetailsScreenView
    extends GetView<SeekersJobDetailsScreenController> {
   SeekersJobDetailsScreenView({super.key});
  final jobsController = Get.find<JobSeekersHomeScreenController>();
   final favoriteJobsController = Get.find<SeekersSavedJobsController>();
   late final isSaved = favoriteJobsController.savedJobs.any((savedJob) => savedJob.jobId.toString() == controller.id.toString());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(
          child: LeadingButtonAppbar(text: "Job Details"),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Obx((){
          if (controller.isLoading.value) {
            return Center(child: SpinKitFadingCircle(
              color: AppColors.primaryColor,
              size: 50.sp,
              duration: const Duration(seconds: 3),
            ));
          }
          final job = controller.singleJob.value;
          String deadline = job!.deadline.toString();
          String onlyDate = deadline.split('T')[0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _jobHeaderCard(job),
              SizedBox(height: 8.h),
              _divider(),
              SizedBox(height: 8.h),
              _detailRow("Job Industry:", '${job.jobIndustry}'),
              SizedBox(height: 15.h),
              _detailRow("Career Level:", '${job.careerLevel}'),
              SizedBox(height: 15.h),
              _detailRow("Salary Type:", '${job.salaryType}'),
              SizedBox(height: 15.h),
              _detailRow("Job Type:", '${job.jobType}'),
              SizedBox(height: 15.h),
              _detailRow("Salary:", '${job.salaryRange}'),
              SizedBox(height: 15.h),
              _detailRow("Working Time:", '${job.workingTime}'),
              SizedBox(height: 15.h),
              _detailRow("Location:", '${job.location}'),
              SizedBox(height: 15.h),
              _detailRow("Deadline:", onlyDate),
              SizedBox(height: 10.h),
              _divider(),
              SizedBox(height: 15.h),
              Text(
                "Description",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              SizedBox(height: 15.h),
              _requirementItem(job.description.toString()),
              SizedBox(height: 15.h),
              Text(
                "Experience",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              SizedBox(height: 15.h),
              _requirementItem(job.experience.toString()),
              SizedBox(height: 15.h),
              Text(
                "Skills",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              SizedBox(height: 15.h),
              if (job.skills != null && job.skills!.isNotEmpty)
                ...job.skills!.map((req) => Column(
                  children: [
                    _requirementItem(req),
                    SizedBox(height: 5.h),
                  ],
                )),
              SizedBox(height: 15.h),
              Text(
                "Responsibilities",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              SizedBox(height: 15.h),
              if (job.responsibilities != null && job.responsibilities!.isNotEmpty)
                ...job.responsibilities!.map((req) => Column(
                  children: [
                    _requirementItem(req),
                    SizedBox(height: 5.h),
                  ],
                )),
              SizedBox(height: 15.h),
              Text(
                "Requirements",
                style: GoogleFonts.inter(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2C3E50),
                ),
              ),
              SizedBox(height: 15.h),
              if (job.requirements != null && job.requirements!.isNotEmpty)
                ...job.requirements!.map((req) => Column(
                  children: [
                    _requirementItem(req),
                    SizedBox(height: 5.h),
                  ],
                )),
              SizedBox(height: 20.h),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      controller.saveJobs(job?.id);
                    },
                    child:  Container(
                      height: 45.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.white,
                        border: Border.all(width: 1, color: Colors.black),
                      ),
                      child:Icon(isSaved ? Icons.favorite: Icons.favorite_border,
                        color: AppColors.primaryColor,
                        size: 18.sp,
                      ),
                    ),
                    ),
                  SizedBox(width: 20.w),

                  Obx((){
                    return controller.isLoading.value ? Center(
                        child: SpinKitWave(color: Colors.green,size: 40.0,)):CustomButton(
                      width: width / 1.5,
                      height: 45.h,
                      text: "Apply Now",
                      onTap: () async {
                        await  controller.jobApply(job?.id);
                      },
                      backgroundColor: AppColors.primaryColor,
                      textColor: Colors.white,
                    );
                  })
                ],
              ),
              SizedBox(height: 20.h,),
            ],
          );
        }),
      ),
    );
  }

  Widget _jobHeaderCard(dynamic job) {
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
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child:
            job != null &&
                job.user?.profilePic.isNotEmpty
                ? Image.network(
              '${Urls.url}${job.user?.profilePic}',
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/find_jobs.png',
                    width: 50.w,
                    height: 50.w,
                    fit: BoxFit.cover,
                  );
                }
            )
                : Image.asset(
              'assets/images/find_jobs.png',
              width: 50.w,
              height: 50.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text(job.title, 16.sp, FontWeight.w600, Color(0xff212121)),
                SizedBox(height: 5.h),
                _text(job.company?.companyName, 12.sp, FontWeight.w400, Color(0xff8A8894)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _text(title, 16.sp, FontWeight.w400, Color(0xff2C3E50)),
        _text(value, 16.sp, FontWeight.w500, const Color(0xFF1E3A8A)),
      ],
    );
  }

  Widget _requirementItem(String text) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.green.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle_outline, color: Colors.green),
          SizedBox(width: 15.w),
          Flexible(
            child: _text(text, 14, FontWeight.w500, Color(0xFF101010)),
          ),
        ],
      ),
    );
  }

  Widget _divider() {
    return Divider(
      thickness: 1,
      color: const Color(0xFFE5E7EB),
    );
  }

  Text _text(
      String text, double fontSize, FontWeight weight, Color color) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: fontSize.sp,
        fontWeight: weight,
        color: color,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }
}
