import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../job_seekers/seekers_apply_screen/views/failed_screens.dart';
import '../../creat_requirment_screen/model/get_my_job_post.dart';
import '../../creat_requirment_screen/views/succes_screen.dart';

class EditPostScreenController extends GetxController {
  final possitionController = TextEditingController();
  final experienceController = TextEditingController();
  final dedlineController = TextEditingController();
  final locationController = TextEditingController();
  final workingTimeController = TextEditingController();
  final descriptionController = TextEditingController();
  final salaryTypeController = TextEditingController();
  final industryController = TextEditingController();
  final careerLevelController = TextEditingController();
  final workController = TextEditingController();
  final salaryController = TextEditingController();
  final typeController = TextEditingController();

  final jobTypesController = TextEditingController();
  final statusController = TextEditingController();

  // ✅ Dynamic Fields
  RxList<TextEditingController> requirementControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> skillsControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> responsibilitiesControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> whyJoinControllers =
      <TextEditingController>[].obs;

  late JobData job;
  late String id;

  @override
  void onInit() {
    super.onInit();

    // Assign Get.arguments to the member variable
    job = Get.arguments as JobData;
    id = job.id ?? "";
    log("Job Id : $id");

    // Fill static fields
    possitionController.text = job.title ?? "";
    experienceController.text = job.experience ?? "";
    dedlineController.text = job.deadline ?? "";
    locationController.text = job.location ?? "";
    workingTimeController.text = job.workingTime ?? "";
    salaryTypeController.text = job.salaryType ?? "";
    industryController.text = job.jobIndustry ?? "";
    careerLevelController.text = job.careerLevel ?? "";
    salaryController.text = job.salaryRange?.toString() ?? "";
    typeController.text = job.jobFlexibility?.isNotEmpty == true
        ? job.jobFlexibility!.first
        : "";
    workController.text = job.workArrangement ?? "";
    descriptionController.text = job.description ?? "";
    jobTypesController.text = job.jobType ?? "";
    statusController.text = job.status ?? "";

    // Fill dynamic lists
    _initDynamicList(job.requirements, requirementControllers);
    _initDynamicList(job.skills, skillsControllers);
    _initDynamicList(job.responsibilities, responsibilitiesControllers);
    _initDynamicList(job.whyJoin, whyJoinControllers);
  }

  void _initDynamicList(
      List<String>? list, RxList<TextEditingController> controllers) {
    if (list != null && list.isNotEmpty) {
      for (var item in list) {
        controllers.add(TextEditingController(text: item));
      }
    } else {
      controllers.add(TextEditingController());
    }
  }

  void addRequirement() => requirementControllers.add(TextEditingController());
  void addSkill() => skillsControllers.add(TextEditingController());
  void addResponsibility() =>
      responsibilitiesControllers.add(TextEditingController());
  void addWhyJoin() => whyJoinControllers.add(TextEditingController());

  void removeRequirement(int i) {
    if (requirementControllers.length > 1) {
      requirementControllers.removeAt(i).dispose();
    }
  }

  void removeSkill(int i) {
    if (skillsControllers.length > 1) {
      skillsControllers.removeAt(i).dispose();
    }
  }

  void removeResponsibility(int i) {
    if (responsibilitiesControllers.length > 1) {
      responsibilitiesControllers.removeAt(i).dispose();
    }
  }

  void removeWhyJoin(int i) {
    if (whyJoinControllers.length > 1) {
      whyJoinControllers.removeAt(i).dispose();
    }
  }

  final isLoading = false.obs;

  /// ✅ API ✅ Update Job Vacancy
  Future<void> postUpdateVacancy() async {

    final body = {
      "title": possitionController.text,
      "experience": experienceController.text,
      "deadline": dedlineController.text,
      "location": locationController.text,
      "workingTime": workingTimeController.text,
      "salaryType": salaryTypeController.text,
      "jobIndustry": industryController.text,
      "careerLevel": careerLevelController.text,
      "salaryRange": salaryController.text,
      "jobFlexibility": [typeController.text],
      "workArragement": workController.text,
      "description": descriptionController.text,
      "requirements": requirementControllers.map((e) => e.text.trim()).toList(),
      "skills": skillsControllers.map((e) => e.text.trim()).toList(),
      "responsibilities": responsibilitiesControllers.map((e) => e.text.trim()).toList(),
      "whyJoin": whyJoinControllers.map((e) => e.text.trim()).toList(),
      "jobType": jobTypesController.text,
      "status": statusController.text.trim()
    };

    log("📌 BODY: $body");

    try {
      isLoading.value = true;
      final response = await NetworkCaller().patchRequest(
        url: '${Urls.getUpdateJob}$id',
        body: body,
      );

      if (response.isSuccess) {
        Logger().i("${response.responseData}");
        log("✅ Job Updated Successfully");
        Get.offAll(() => SuccesScreen());
      } else {
        log("❌ Update Failed");
        Get.to(() => FailedScreens());
      }
    } catch (e) {
      log("❌ Exception: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Delete Post
  Future<void> deletePost() async {
    try {
      isLoading.value = true;
      final response = await NetworkCaller().deleteRequest(
        url: '${Urls.deleteJob}$id',
      );

      if (response.isSuccess) {
        log("✅ Job Deleted Successfully");
        Get.offAll(() => SuccesScreen());
      }else{
        log("❌ Delete Failed");
        Get.to(() => FailedScreens());
      }
    } catch (e) {
      log("❌ Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    possitionController.dispose();
    experienceController.dispose();
    dedlineController.dispose();
    locationController.dispose();
    workingTimeController.dispose();
    descriptionController.dispose();
    salaryTypeController.dispose();
    industryController.dispose();
    careerLevelController.dispose();
    workController.dispose();
    salaryController.dispose();
    typeController.dispose();
    jobTypesController.dispose();
    statusController.dispose();

    for (var c in requirementControllers) c.dispose();
    for (var c in skillsControllers) c.dispose();
    for (var c in responsibilitiesControllers) c.dispose();
    for (var c in whyJoinControllers) c.dispose();
    super.onClose();
  }
}
