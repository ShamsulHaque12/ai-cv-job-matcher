import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/edit_post_screen_controller.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/custom_button.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../../theme/app_colors.dart';

class EditPostScreenView extends GetView<EditPostScreenController> {
  EditPostScreenView({super.key});

  Widget buildDynamicSection({
    required String title,
    required RxList<TextEditingController> list,
    required Function onAdd,
    required Function(int) onRemove,
  }) {
    return Obx(() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style:
            TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp)),
        SizedBox(height: 8.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 6.h),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: list[index],
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: "Write here...",
                        fillColor: const Color(0xFFE3F3EF),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 18),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        prefixIcon: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                  if (list.length > 1)
                    GestureDetector(
                      onTap: () => onRemove(index),
                      child: Container(
                        margin: const EdgeInsets.only(left: 6),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.delete, color: Colors.red),
                      ),
                    ),
                ],
              ),
            );
          },
        ),
        CustomButton(
          onTap: () => onAdd(),
          text: "Add More",
          backgroundColor: const Color(0xFFE5E7EB),
          textColor: AppColors.primarytextColor,
          borderColor: Colors.transparent,
          prefixIcon: Icon(Icons.add, color: AppColors.primaryColor),
        ),
        SizedBox(height: 18.h),
      ],
    ));
  }

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
            // ✅ Static Fields
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
                  borderSide: BorderSide(color: Colors.black, width: 1),
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
                  // Convert to ISO 8601 format for backend
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
              textEditingController: controller.industryController,
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            ),

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

            CustomTextField(
              controllerTag: "level",
              titleText: "Job Type*",
              hintText: "Enter job type",
              isDropdown: true,
              dropdownItems: [
                "onsite",
                "remote",
                "hybrid",

              ],
              textEditingController: controller.jobTypesController,
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            ),

            CustomTextField(
              controllerTag: "sta",
              titleText: "Status*",
              hintText: "Status Type",
              isDropdown: true,
              dropdownItems: ["ACTIVE"],
              textEditingController: controller.statusController,
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              suffixIcon: const Icon(Icons.keyboard_arrow_down_sharp),
            ),


            // ✅ Dynamic Fields
            buildDynamicSection(
              title: "Requirements*",
              list: controller.requirementControllers,
              onAdd: controller.addRequirement,
              onRemove: controller.removeRequirement,
            ),
            buildDynamicSection(
              title: "Skills*",
              list: controller.skillsControllers,
              onAdd: controller.addSkill,
              onRemove: controller.removeSkill,
            ),
            buildDynamicSection(
              title: "Responsibilities*",
              list: controller.responsibilitiesControllers,
              onAdd: controller.addResponsibility,
              onRemove: controller.removeResponsibility,
            ),
            buildDynamicSection(
              title: "Why Join Us*",
              list: controller.whyJoinControllers,
              onAdd: controller.addWhyJoin,
              onRemove: controller.removeWhyJoin,
            ),

            CustomButton(
              onTap: () {
                controller.postUpdateVacancy();
              },
              text: "Post Update Vacancy",
              backgroundColor: AppColors.primaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
