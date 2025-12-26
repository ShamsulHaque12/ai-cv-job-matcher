import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../employer_auth/auth/company_information/controllers/employer_auth_company_information_controller.dart';
import '../../job_home_employer_screen/controllers/job_home_seker_screen_controller.dart';
import '../model/get_my_job_post.dart';
import '../views/failed_screen.dart';
import '../views/succes_screen.dart';

class CreatRequirmentScreenController extends GetxController {
  final EmployerAuthCompanyInformationController
  employerAuthCompanyInformationController = Get.find();
  final JobHomeSekerScreenController jobHomeSekerScreenController = Get.find();

  final jobTypeController = TextEditingController();
  final statusController = TextEditingController();

  final isLoading = false.obs;

  // Coming from Screen 1
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

  @override
  void onInit() {
    super.onInit();
    employerAuthCompanyInformationController.getMyCompanys();
    addRequirement();
    addSkill();
    addResponsibility();
    addWhyJoin();
    getMyJobVacancies();
  }

  void assignData(Map<String, dynamic> data) {
    debugPrint('Data Retreve: $data');
    //  final data = Get.arguments as Map<String, dynamic>? ?? {};
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
  }

  RxList<TextEditingController> requirementControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> skillsControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> responsibilitiesControllers =
      <TextEditingController>[].obs;
  RxList<TextEditingController> whyJoinControllers =
      <TextEditingController>[].obs;

  void addRequirement() => requirementControllers.add(TextEditingController());
  void addSkill() => skillsControllers.add(TextEditingController());
  void addResponsibility() =>
      responsibilitiesControllers.add(TextEditingController());
  void addWhyJoin() => whyJoinControllers.add(TextEditingController());

  void removeRequirement(int i) {
    if (requirementControllers.length > 1) {
      requirementControllers[i].dispose();
      requirementControllers.removeAt(i);
    }
  }

  void removeSkill(int i) {
    if (skillsControllers.length > 1) {
      skillsControllers[i].dispose();
      skillsControllers.removeAt(i);
    }
  }

  void removeResponsibility(int i) {
    if (responsibilitiesControllers.length > 1) {
      responsibilitiesControllers[i].dispose();
      responsibilitiesControllers.removeAt(i);
    }
  }

  void removeWhyJoin(int i) {
    if (whyJoinControllers.length > 1) {
      whyJoinControllers[i].dispose();
      whyJoinControllers.removeAt(i);
    }
  }

  List<String> get requirementList =>
      requirementControllers.map((e) => e.text.trim()).toList();
  List<String> get skillsList =>
      skillsControllers.map((e) => e.text.trim()).toList();
  List<String> get responsibilitiesList =>
      responsibilitiesControllers.map((e) => e.text.trim()).toList();
  List<String> get whyJoinList =>
      whyJoinControllers.map((e) => e.text.trim()).toList();

  /// ✅Get My Job Vacancies.................................................
  RxList<JobData> activeJobPosts = <JobData>[].obs;
  RxList<JobData> inactiveJobPosts = <JobData>[].obs;
  var isLoadingMore = false.obs;
  var currentPage = 1.obs;
  var totalPages = 1.obs;
  /// ✅Get My Job Vacancies.................................................
  RxList<JobData> myJobPosts = <JobData>[].obs;
  Future<void> getMyJobVacancies({bool loadMore = false}) async {
    try {
      if (isLoading.value || isLoadingMore.value) return;

      if (loadMore) {
        if (currentPage.value >= totalPages.value) return;
        currentPage.value++;
        isLoadingMore.value = true;
      } else {
        isLoading.value = true;
        currentPage.value = 1;
        myJobPosts.clear();
        activeJobPosts.clear();
        inactiveJobPosts.clear();
      }

      final NetworkResponse response = await NetworkCaller().getRequest(
        url: "${Urls.getMyJob}?page=${currentPage.value}&limit=10",
      );

      if (response.isSuccess && response.responseData != null) {
        final jobPost = GetMyJobPost.fromJson(response.responseData!);

        totalPages.value = jobPost.data!.meta!.totalPage ?? 1;

        if (jobPost.data?.jobs != null) {
          myJobPosts.addAll(jobPost.data!.jobs!);

          for (var job in jobPost.data!.jobs!) {
            final status = job.status?.toUpperCase() ?? "";
            if (status == "ACTIVE") {
              activeJobPosts.add(job);
            } else if (["DELETED", "EXPIRED", "SUSPENDED"].contains(status)) {
              inactiveJobPosts.add(job);
            }
          }
        }

        log("✅ Page: ${currentPage.value} / ${totalPages.value}");
        log("✅ Total Jobs: ${myJobPosts.length}");
      } else {
        log("❌ Error fetching my jobs: ${response.errorMessage}");
      }
    } catch (e) {
      log("❌ Exception fetching my jobs: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  /// ✅ Post Job Vacancy.................................................
  final getMyJobPost = Rxn<GetMyJobPost>();
  Future<void> postJobVacancy() async {
    if (jobTypeController.text.isEmpty || statusController.text.isEmpty) {
      Get.snackbar("Error", "Please fill all fields!");
      return;
    }

    var companyId = employerAuthCompanyInformationController.companyId;

    /// ✅ Safety check if still null
    if (companyId == null) {
      await employerAuthCompanyInformationController.getMyCompanys();
      companyId = employerAuthCompanyInformationController.companyId;
    }

    if (companyId == null) {
      Get.snackbar("Error", "Company ID not loaded!");
      return;
    }
    log("📌 Used Company ID: $companyId");

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
      "companyId": companyId,
    };

    log("📌 BODY: $body");

    try {
      isLoading.value = true;

      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.creatJob,
        body: body,
      );

      if (response.isSuccess) {
        jobHomeSekerScreenController.fetchDashboardAndProfile();
        Get.to(() => SuccesScreen());
        getMyJobVacancies();
      } else {
        Get.to(() => FailedScreen());
        log("❌ Error: ${response.errorMessage}");
      }
    } catch (e) {
      log("❌ Exception: $e");
      Get.snackbar("Error", e.toString());
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
