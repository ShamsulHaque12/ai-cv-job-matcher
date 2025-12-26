
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_colors.dart';
import '../../search/controllers/job_seekers_search_controller.dart';
import '../controllers/job_seekers_job_filter_screen_controller.dart';
class JobFilterView extends StatelessWidget {
  JobFilterView({super.key});
  final controller = Get.find<JobSeekersSearchController>();
  final jobfilter = Get.put(JobSeekersJobFilterScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(vertical: 30.h,  horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text("Employment Type", style: GoogleFonts.inter(
                   fontWeight: FontWeight.w600,
                   fontSize: 16.sp,
                 color: Color(0xff2C3E50)
               )),
              SizedBox(height: 10.h,),
              Obx(() => Wrap(
                spacing: 5,
                children: jobfilter.employmentTypes.map((type) {
                  return ChoiceChip(
                    label: Text(type,style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                        color: jobfilter.selectedEmployment.value == type
                            ? Colors.white
                            : AppColors.primaryColor
                    ),),
                    selected: jobfilter.selectedEmployment.value == type,
                    onSelected: (_) => jobfilter.selectedEmployment.value =
                    jobfilter.selectedEmployment.value == type ? '' : type,
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                      side: BorderSide(color: AppColors.primaryColor)
                    ),
                    selectedColor: AppColors.primaryColor,
                  );
                }).toList(),
              )),
              const SizedBox(height: 20),

               Text("Work Arrangement", style: GoogleFonts.inter(
                   fontWeight: FontWeight.w600,
                   fontSize: 16.sp,
                   color: Color(0xff2C3E50)
               )),
              Obx(() => Wrap(
                spacing: 8,
                children: jobfilter.workArrangements.map((type) {
                  return ChoiceChip(
                    label: Text(type,style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: jobfilter.selectedWork.value == type
                            ? Colors.white
                            : AppColors.primaryColor
                    ),),
                    selected: jobfilter.selectedWork.value == type,
                    onSelected: (_) => jobfilter.selectedWork.value =
                    jobfilter.selectedWork.value == type ? '' : type,
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                        side: BorderSide(color: AppColors.primaryColor)
                    ),
                    selectedColor: AppColors.primaryColor,
                  );
                }).toList(),
              )),
              const SizedBox(height: 20),

               Text("Career Level", style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xff2C3E50)
              )),
              Obx(() => Wrap(
                spacing: 8,
                children: jobfilter.careerLevels.map((type) {
                  return ChoiceChip(
                    label: Text(type,style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: jobfilter.selectedCareer.value == type
                            ? Colors.white
                            : AppColors.primaryColor
                    ),),
                    selected: jobfilter.selectedCareer.value == type,
                    onSelected: (_) => jobfilter.selectedCareer.value =
                    jobfilter.selectedCareer.value == type ? '' : type,
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                        side: BorderSide(color: AppColors.primaryColor)
                    ),
                    selectedColor: AppColors.primaryColor,
                  );
                }).toList(),
              )),
              Text("Industry", style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xff2C3E50)
              )),
              Obx(() => Wrap(
                spacing: 8,
                children: jobfilter.salleryRange.map((type) {
                  return ChoiceChip(
                    label: Text(type,style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: jobfilter.selectedSalery.value == type
                            ? Colors.white
                            : AppColors.primaryColor
                    ),),
                    selected: jobfilter.selectedSalery.value == type,
                    onSelected: (_) => jobfilter.selectedSalery.value =
                    jobfilter.selectedSalery.value == type ? '' : type,
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                        side: BorderSide(color: AppColors.primaryColor)
                    ),
                    selectedColor: AppColors.primaryColor,
                  );
                }).toList(),
              )),
               SizedBox(height: 10.h),
              Text("Flexibility", style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xff2C3E50)
              )),
              Obx(() => Wrap(
                spacing: 8,
                children: jobfilter.flexibility.map((type) {
                  return ChoiceChip(
                    label: Text(type,style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: jobfilter.selectedSFlexibility.value == type
                            ? Colors.white
                            : AppColors.primaryColor
                    ),),
                    selected: jobfilter.selectedSFlexibility.value == type,
                    onSelected: (_) => jobfilter.selectedSFlexibility.value =
                    jobfilter.selectedSFlexibility.value == type ? '' : type,
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                        side: BorderSide(color: AppColors.primaryColor)
                    ),
                    selectedColor: AppColors.primaryColor,
                  );
                }).toList(),
              )),
              SizedBox(height: 10.h),
              Text("Special Opportunities (Optional) Apprenticeship", style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xff2C3E50)
              )),
              Obx(() => Wrap(
                spacing: 8,
                children: jobfilter.specailOporinity.map((type) {
                  return ChoiceChip(
                    label: Text(type,style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: jobfilter.selectedSpecailOporinity.value == type
                            ? Colors.white
                            : AppColors.primaryColor
                    ),),
                    selected: jobfilter.selectedSpecailOporinity.value == type,
                    onSelected: (_) => jobfilter.selectedSpecailOporinity.value =
                    jobfilter.selectedSpecailOporinity.value == type ? '' : type,
                    backgroundColor: Colors.white,
                    shape: StadiumBorder(
                        side: BorderSide(color: AppColors.primaryColor)
                    ),
                    selectedColor: AppColors.primaryColor,
                  );
                }).toList(),
              )),
              SizedBox(height: 10.h),
              Text("Location", style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  color: Color(0xff2C3E50)
              )),
              SizedBox(height: 10.h),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.location_on_outlined),
                  hintText: "New York,US",
                  hintStyle: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 12.sp,
                      color: Color(0xff2C3E50)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor
                      )
                  )
                )
              ),
              const SizedBox(height: 40),
              /*Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CustomButton(text: 'Clear',onTap: () {
                      controller.applyFilter(
                        employmentType: jobfilter.selectedEmployment.value.isEmpty
                            ? null
                            : jobfilter.selectedEmployment.value,
                        workArrangement: jobfilter.selectedWork.value.isEmpty
                            ? null
                            : jobfilter.selectedWork.value,
                        careerLevel: jobfilter.selectedCareer.value.isEmpty
                            ? null
                            : jobfilter.selectedCareer.value,
                      );
                      Get.back();
                    },backgroundColor: Colors.white,textColor: AppColors.primaryColor,),
                  ),
                  const SizedBox(width: 10),
                 *//* Expanded(
                    flex: 2,
                    child: CustomButton(text: 'Apply filter',onTap: () {
                      controller.applyFilter(
                        employmentType: jobfilter.selectedEmployment.value.isEmpty
                            ? null
                            : jobfilter.selectedEmployment.value,
                        workArrangement: jobfilter.selectedWork.value.isEmpty
                            ? null
                            : jobfilter.selectedWork.value,
                        careerLevel: jobfilter.selectedCareer.value.isEmpty
                            ? null
                            : jobfilter.selectedCareer.value,
                      );
                      Get.back();
                    },),
                  ),*//*
                ],
              ),*/

            ],
          ),
        ),
      ),
    );
  }
}
