import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import '../../../theme/app_colors.dart';
import '../../../common/custom_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/leading_button_app_bar.dart';
import '../../add_new_vacancy/controllers/add_new_vacancy_controller.dart';
import '../controllers/creat_requirment_screen_controller.dart';

class CreatRequirmentScreenView extends GetView<CreatRequirmentScreenController> {
  final AddNewVacancyController addNewVacancyController = Get.put(AddNewVacancyController());
  CreatRequirmentScreenView({super.key});

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
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp)),
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
                      maxLines: 2,
                      decoration: InputDecoration(
                        hintText: "Write here...",
                        fillColor: const Color(0xFFE3F3EF),
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
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
    Get.put(CreatRequirmentScreenController());
    final data = Get.arguments as Map<String, dynamic>? ?? {};
    controller.assignData(data);
   // debugPrint("data $data");
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SafeArea(child: LeadingButtonAppbar()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
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
              textEditingController: controller.jobTypeController,
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

            SizedBox(height: 25.h),
            Obx((){
              return controller.isLoading.value
                  ? Center(child: SpinKitWave(
                color: Colors.green,
                size: 40.0,
              ))
                  : CustomButton(
                onTap: () {
                  controller.postJobVacancy();
                },
                text: "Post Job Vacancy",
                backgroundColor: AppColors.primaryColor,
                textColor: Colors.white,
              );
            }),
          ],
        ),
      ),
    );
  }
}
