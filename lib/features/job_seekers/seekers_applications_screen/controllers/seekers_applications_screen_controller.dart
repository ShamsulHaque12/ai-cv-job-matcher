import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:string_similarity/string_similarity.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../model/all_post_model.dart';

class SeekersApplicationsScreenController extends GetxController {
  final searchController = TextEditingController();
  final jobApplication = <JobApplication>[].obs;
  final filteredApplications = <JobApplication>[].obs;
  final isLoading = false.obs;
  final selectedFilter = 'all'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAllJobApplication();

    // search listener
    searchController.addListener(() {
      applyFilter(selectedFilter.value);
    });
  }

  /// Fetch all job applications
  Future<void> fetchAllJobApplication() async {
    try {
      isLoading.value = true;
      final response = await NetworkCaller().getRequest(url: Urls.jobApplication);

      if (response.isSuccess) {
        final data = response.responseData?['data']['data'] as List;
        jobApplication.assignAll(data.map((e) => JobApplication.fromJson(e)).toList());
        applyFilter('all'); // initially show all
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong: $e',
          snackPosition: SnackPosition.TOP);
    } finally {
      isLoading.value = false;
    }
  }

  /// Apply search + filter
  void applyFilter(String filter) {
    selectedFilter.value = filter;

    // Base list according to filter
    List<JobApplication> baseList = filter == 'all'
        ? jobApplication
        : jobApplication
        .where((app) =>
    (app.status ?? '').toLowerCase() ==
        filter.toLowerCase())
        .toList();

    // Apply search query
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filteredApplications.assignAll(baseList);
    } else {
      final results = baseList.where((app) {
        final title = app.position?.toLowerCase() ?? '';
        final company = app.companyName?.toLowerCase() ?? '';
        final scoreTitle = title.similarityTo(query);
        final scoreCompany = company.similarityTo(query);
        return scoreTitle >= 0.5 || scoreCompany >= 0.5;
      }).toList();

      filteredApplications.assignAll(results);
    }
  }

  /// Status color helper
  Color getStatusColor(String status) {
    switch (status.toUpperCase()) {
      case "PENDING":
        return Colors.orange;
      case "REJECTED":
        return Colors.red;
      case "SELECTED":
      case "INTERVIEW":
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
