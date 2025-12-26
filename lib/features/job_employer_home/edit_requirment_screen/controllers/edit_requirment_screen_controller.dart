import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../job_seekers/seekers_apply_screen/views/failed_screens.dart';
import '../../creat_requirment_screen/views/succes_screen.dart';
import '../../widgets/delete_screen.dart';
import '../../widgets/delete_success.dart';

class EditRequirmentScreenController extends GetxController {
  final jobTypeController = TextEditingController();
  final statusController = TextEditingController();

  final isLoading = false.obs;

  // ✅ Data Received From Screen 1
  late String id;
  late String position;
  late String experience;
  late String deadline;
  late String location;
  late String workingTime;
  late String salaryType;
  late String jobIndustryName;
  late String careerLevel;
  late String salary;
  late List<String> jobFlexibility;
  late String workArrangement;
  late String description;

  // ✅ Dynamic Fields
  RxList<TextEditingController> requirementControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> skillsControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> responsibilitiesControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> whyJoinControllers =
      <TextEditingController>[].obs;

  @override
  void onInit() {
    super.onInit();

    // final data = Get.arguments as Map<String, dynamic> ?? {};
    final data = (Get.arguments != null && Get.arguments is Map<String, dynamic>)
        ? Get.arguments as Map<String, dynamic>
        : <String, dynamic>{};


    /// ✅ Fill basic data
    id = data["id"] ?? "";
    position = data["position"] ?? "";
    experience = data["experience"] ?? "";
    deadline = data["deadline"] ?? "";
    location = data["location"] ?? "";
    workingTime = data["workingTime"] ?? "";
    salaryType = data["salaryType"] ?? "";
    jobIndustryName = data["jobIndustryName"] ?? "";
    careerLevel = data["careerLevel"] ?? "";
    salary = data["salary"] ?? "";
    jobFlexibility = List<String>.from(data["jobFlexibility"] ?? []);
    workArrangement = data["workArrangement"] ?? "";
    description = data["description"] ?? "";

    jobTypeController.text = data["jobType"] ?? "";
    statusController.text = data["status"] ?? "";

    /// ✅ Fill Lists
    _initDynamicList(data["requirements"], requirementControllers);
    _initDynamicList(data["skills"], skillsControllers);
    _initDynamicList(data["responsibilities"], responsibilitiesControllers);
    _initDynamicList(data["whyJoin"], whyJoinControllers);
  }

  /// ✅ Auto Load List or Create One Empty
  void _initDynamicList(
    dynamic list,
    RxList<TextEditingController> controllers,
  ) {
    if (list != null && list is List && list.isNotEmpty) {
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

  /// ✅ Get Final Lists To Send API
  List<String> get requirementList => requirementControllers
      .map((e) => e.text.trim())
      .where((e) => e.isNotEmpty)
      .toList();
  List<String> get skillsList => skillsControllers
      .map((e) => e.text.trim())
      .where((e) => e.isNotEmpty)
      .toList();
  List<String> get responsibilitiesList => responsibilitiesControllers
      .map((e) => e.text.trim())
      .where((e) => e.isNotEmpty)
      .toList();
  List<String> get whyJoinList => whyJoinControllers
      .map((e) => e.text.trim())
      .where((e) => e.isNotEmpty)
      .toList();

  /// ✅ API ✅ Update Job Vacancy
  Future<void> postUpdateVacancy() async {

    final body = {
      "title": position,
      "experience": experience,
      "deadline": deadline,
      "location": location,
      "workingTime": workingTime,
      "salaryType": salaryType,
      "jobIndustry": jobIndustryName,
      "careerLevel": careerLevel,
      "salaryRange": salary,
      "jobFlexibility": jobFlexibility,
      "workArragement": workArrangement,
      "description": description,
      "requirements": requirementList,
      "skills": skillsList,
      "responsibilities": responsibilitiesList,
      "whyJoin": whyJoinList,
      "jobType": jobTypeController.text,
      "status": statusController.text,
    };

    log("📌 BODY: $body");

    try {
      isLoading.value = true;
      final response = await NetworkCaller().patchRequest(
        url: '${Urls.getUpdateJob}$id',
        body: body,
      );

      if (response.isSuccess) {
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
  Future<void> deletePost(String jobId) async {
    try {
      isLoading.value = true;
      log("Delete Api: ${Urls.deleteJob}$jobId");
      final response = await NetworkCaller().deleteRequest(
        url: '${Urls.deleteJob}$jobId',
      );

      if (response.isSuccess) {
        log("✅ Job Deleted Successfully");
        Get.offAll(() => DeleteSuccess());
      }else{
        log("❌ Delete Failed");
        Get.offAll(() => DeleteScreen());
      }
    } catch (e) {
      log("❌ Exception: $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    jobTypeController.dispose();
    statusController.dispose();

    for (var c in requirementControllers) c.dispose();
    for (var c in skillsControllers) c.dispose();
    for (var c in responsibilitiesControllers) c.dispose();
    for (var c in whyJoinControllers) c.dispose();
    super.onClose();
  }
}
