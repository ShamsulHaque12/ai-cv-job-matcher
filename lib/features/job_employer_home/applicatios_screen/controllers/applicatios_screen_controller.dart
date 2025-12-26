import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../creat_requirment_screen/model/get_my_job_post.dart';

class ApplicatiosScreenController extends GetxController {
  final searchController = TextEditingController();
  var selectedFilter = 'all'.obs;

  // All jobs fetched from API
  var allJobs = <JobData>[].obs;

  // Filtered jobs for search
  var filteredJobs = <JobData>[].obs;

  @override
  void onInit() {
    super.onInit();

    // When allJobs changes, update filteredJobs automatically
    ever(allJobs, (_) => filterJobs(searchController.text));

    // When user types, filter the list
    searchController.addListener(() {
      filterJobs(searchController.text);
    });
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
    filterJobs(searchController.text);
  }

  // Core filter function
  void filterJobs(String query) {
    final lowerQuery = query.toLowerCase();

    filteredJobs.value = allJobs.where((job) {
      final title = job.title?.toLowerCase() ?? '';
      final userName = "${job.user?.firstName ?? ''} ${job.user?.lastName ?? ''}".toLowerCase();
      final status = job.status?.toLowerCase() ?? '';

      final matchesSearch = title.contains(lowerQuery) || userName.contains(lowerQuery);

      if (selectedFilter.value != 'all') {
        return matchesSearch && status == selectedFilter.value.toLowerCase();
      }
      return matchesSearch;
    }).toList();
  }

  // Example: call this when API data loaded
  void setJobs(List<JobData> jobs) {
    allJobs.assignAll(jobs);
  }
}
