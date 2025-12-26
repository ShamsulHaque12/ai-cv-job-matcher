import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../routes/app_pages.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/leading_button_app_bar.dart';
import '../controllers/add_new_vacancy_controller.dart';

class AddNewVacancyView extends GetView<AddNewVacancyController> {
  const AddNewVacancyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar()),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text("Add New Post",style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.primarytextColor,
            ),),
            // Center(
            //   child: Obx(() {
            //     return Stack(
            //       children: [
            //         CircleAvatar(
            //           radius: 60.r,
            //           backgroundImage: controller.selectedImage.value != null
            //               ? FileImage(controller.selectedImage.value!)
            //               : Image.asset("assets/icon/profile.png").image,
            //         ),
            //         Positioned(
            //           bottom: 0,
            //           right: -5,
            //           child: GestureDetector(
            //             onTap: () => _openBottomSheet(context),
            //             child: SizedBox(
            //               height: 30.h,
            //               width: 30.w,
            //               child: Image.asset("assets/icon/edit.png"),
            //             ),
            //           ),
            //         ),
            //       ],
            //     );
            //   }),
            // ),
            SizedBox(height: 10.h,),
            CustomTextField(
              textEditingController: controller.possitionController,
              titleText: "Open Position*",
              hintText: "Name Position",
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),

            CustomTextField(
              textEditingController: controller.experienceController,
              titleText: "Experience*",
              hintText: "experience",
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),
            SizedBox(height: 10.h,),
            TextField(
              controller: controller.dedlineController,
              readOnly: true,
              decoration: InputDecoration(
                hintText: "Select deadline",
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 18,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: Colors.black, width: 1.w),
                ),
                prefixIcon: Icon(Icons.calendar_today, color: Colors.grey),
              ),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: Get.context!,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );

                if (pickedDate != null) {
                  String isoDate = pickedDate.toUtc().toIso8601String();
                  controller.dedlineController.text = isoDate;
                }
              },
            ),

            CustomTextField(
              textEditingController: controller.locationController,
              titleText: "Location*",
              hintText: "Location",
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),

            CustomTextField(
              textEditingController: controller.workingTimeController,
              titleText: "Working Time*",
              hintText: "9 AM - 5 PM",
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),

            CustomTextField(
              controllerTag: "salaryType",
              titleText: "Salary Type*",
              hintText: "type",
              isDropdown: true,
              dropdownItems: ["monthly", "yearly", "hourly", "daily"],
              textEditingController: controller.salaryTypeController,
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            ),

            // CustomTextField(
            //   controllerTag: "industry",
            //   titleText: "Job Industry Type*",
            //   hintText: "Select industry",
            //   isDropdown: true,
            //   dropdownItems: [
            //     "INDUSTRYANDIT",
            //     "EDUCATION",
            //     "HEALTHCARE",
            //     "CREATIVE",
            //     "FINANCE",
            //     "MARKETING",
            //     "RETAILSANDSALES",
            //     "CUSTOMERSERVICE",
            //     "TRANSPORTATION",
            //     "ENGINEERING",
            //     "HOSPITALITY",
            //     "CONSTRUCTION",
            //     "OTHER",
            //   ],
            //   textEditingController: controller.jobTypeController,
            //   borderSide: const BorderSide(color: Colors.grey, width: 1),
            //   suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            // ),

            CustomTextField(
              controllerTag: "industry",
              titleText: "Job Industry Type*",
              hintText: "Select industry",
              isDropdown: true,
              dropdownItems: [
                "INDUSTRYANDIT",
                "EDUCATION",
                "HEALTHCARE",
                "CREATIVE",
                "FINANCE",
                "MARKETING",
                "RETAILSANDSALES",
                "CUSTOMERSERVICE",
                "TRANSPORTATION",
                "ENGINEERING",
                "HOSPITALITY",
                "CONSTRUCTION",
                "OTHER",
              ],
              onChanged: (value) {
                if (value == "OTHER") {
                  controller.isOtherSelected.value = true;
                } else {
                  controller.isOtherSelected.value = false;
                  controller.jobTypeController.text = value;
                }
              },
              textEditingController: controller.jobTypeController,
              borderSide: BorderSide(color: Colors.grey, width: 1),
              suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
            ),

            /// === Show extra textfield only if OTHER selected ===
            Obx(() {
              return controller.isOtherSelected.value
                  ? Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    controller: controller.otherTextController,
                    decoration: const InputDecoration(
                      labelText: "Write your industry type",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      controller.jobTypeController.text = value;
                    },
                  ),
                ],
              )
                  : const SizedBox();
            }),

            CustomTextField(
              controllerTag: "level",
              titleText: "Career Level*",
              hintText: "Select level",
              isDropdown: true,
              dropdownItems: [
                "INTERN",
                "ENTRYLEVEL",
                "MIDLEVEL",
                "SENIORLEVEL",
                "MANAGEMENT",
                "EXECUTIVE",
              ],
              textEditingController: controller.careerLevelController,
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            ),

            CustomTextField(
              textEditingController: controller.salaryController,
              titleText: "Salary*",
              hintText: "4000 - 6000",
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),

            CustomTextField(
              controllerTag: "jobType",
              titleText: "Job Flexibility*",
              hintText: "Select Job",
              isDropdown: true,
              dropdownItems: [
                "FLEXIBLEHOURS",
                "SHIFTWORK",
                "COMPRESSEDWEEK",
                "JOBSHARING",
                "REMOTEWORK",
                "NIGHTSHIFT",
                "WEEKENDWORK",
              ],
              textEditingController: controller.typeController,
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            ),

            CustomTextField(
              controllerTag: "workType",
              titleText: "Work Arrangement*",
              hintText: "Work Type",
              isDropdown: true,
              dropdownItems: [
                "FULLTIME",
                "PARTTIME",
                "CONTRACT",
                "TEMPORARY",
                "FREELANCE",
                "INTERN",
              ],
              textEditingController: controller.workController,
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            ),

            CustomTextField(
              textEditingController: controller.descriptionController,
              titleText: "Description*",
              hintText: "Description must be at least 10 characters long",
              borderSide: const BorderSide(color: Colors.grey, width: 1),
            ),

            SizedBox(height: 22.h),
            CustomButton(
              text: "Next",
              onTap: () {
                if (
                    controller.possitionController.text.isEmpty ||
                    controller.experienceController.text.isEmpty ||
                    controller.dedlineController.text.isEmpty ||
                    controller.locationController.text.isEmpty ||
                    controller.workingTimeController.text.isEmpty ||
                    controller.salaryTypeController.text.isEmpty ||
                    controller.jobTypeController.text.isEmpty ||
                    controller.careerLevelController.text.isEmpty ||
                    controller.salaryController.text.isEmpty ||
                    controller.typeController.text.isEmpty ||
                    controller.workController.text.isEmpty ||
                    controller.descriptionController.text.isEmpty) {
                  Get.snackbar(
                    "Error",
                    "Please fill in all fields before continuing",
                  );
                  return;
                }

                final argumens = {
                  "position": controller.possitionController.text,
                  "experience": controller.experienceController.text,
                  "deadline": controller.dedlineController.text,
                  "location": controller.locationController.text,
                  "workingTime": controller.workingTimeController.text,
                  "salaryType": controller.salaryTypeController.text,
                  "jobIndustryName": controller.jobTypeController.text,
                  "careerLevel": controller.careerLevelController.text,
                  "salary": controller.salaryController.text,
                  "jobFlexibility": [controller.typeController.text],
                  "workArrangement": controller.workController.text,
                  "description": controller.descriptionController.text,
                };
                // 🧠 সব ডেটা log এ print করো
                print("🧩 Sending job data to CreatRequirmentScreen:");
                argumens.forEach((key, value) {
                  print("➡️ $key: $value");
                });

                Get.toNamed(
                  Routes.CREAT_REQUIRMENT_SCREEN,
                  arguments: argumens,
                );
              },

              backgroundColor: const Color(0xFFE5E7EB),
              textColor: AppColors.primarytextColor,
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
  // void _openBottomSheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
  //     ),
  //     builder: (_) {
  //       return Padding(
  //         padding: EdgeInsets.all(20),
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Container(
  //               width: double.infinity,
  //               height: 5.h,
  //               decoration: BoxDecoration(
  //                 color: Colors.grey.shade400,
  //                 borderRadius: BorderRadius.circular(10),
  //               ),
  //             ),
  //             SizedBox(height: 20.h),
  //             Text(
  //               "Change Logo Company",
  //               style: GoogleFonts.inter(
  //                 fontSize: 18.sp,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             SizedBox(height: 10.h),
  //             GestureDetector(
  //               onTap: () async {
  //                 Get.back();
  //                 await controller.pickImage();
  //               },
  //               child: Container(
  //                 height: 60.h,
  //                 width: 60.w,
  //                 decoration: BoxDecoration(
  //                   color: Color(0xFF1E3A8A1A).withAlpha(20),
  //                   shape: BoxShape.circle,
  //                 ),
  //                 child: Image.asset("assets/icon/file1.png"),
  //               ),
  //             ),
  //             SizedBox(height: 5.h),
  //             Text(
  //               "From Gallery",
  //               style: GoogleFonts.inter(
  //                 fontSize: 12.sp,
  //                 fontWeight: FontWeight.w600,
  //               ),
  //             ),
  //             SizedBox(height: 10.h),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
