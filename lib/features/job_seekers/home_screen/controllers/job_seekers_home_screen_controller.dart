import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../seekers_saved_jobs/controllers/seekers_saved_jobs_controller.dart';
import '../../seekers_saved_jobs/model/job_favourite_model.dart';
import '../model/job_model.dart';

class JobSeekersHomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  final jobs = <JobModel>[].obs;
  final favoriteJobs = <FavoriteModel>[].obs;
  final isFav = false.obs;
  int currentPage = 1;
  bool hasMore = true;
  final scrollController = ScrollController();
  @override
  void onInit()async {
    super.onInit();
    final favoriteJobsController = Get.find<SeekersSavedJobsController>();
    await favoriteJobsController.getSavedJobs();
    await fetchAllJobs();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        fetchAllJobs();
      }
    });

    ever(favoriteJobsController.savedJobs, (value) {
      favoriteJobs.value = value;
      print("TOTAL FAV: ${favoriteJobs.value.length}");
    });
  }

  Future<void> fetchAllJobs() async {
    if (isLoading.value || !hasMore) return;

    try {
      isLoading.value = true;

      NetworkResponse response =
      await NetworkCaller().getRequest(
        url: Urls.recommendedJobs,
        queryParams: {
          "page": currentPage,
          "limit": 10,
        },
      );

      if (response.isSuccess) {
        // API structure: data → data → list
        final dataList = response.responseData?['data']['data'] as List;

        // No more data
        if (dataList.isEmpty) {
          hasMore = false;
        } else {
          final newJobs = dataList.map((e) => JobModel.fromJson(e)).toList();
          for (var job in newJobs) {
            if (!jobs.any((j) => j.id == job.id)) {
              jobs.add(job);
            }
          }
          currentPage++;
        }

      } else {
        Get.toNamed(Routes.AUTH_UPLOAD_RESUME);
      }
    } catch (e) {
      log("Error: $e");
      Get.snackbar("Error", "Something went wrong!",
          snackPosition: SnackPosition.TOP);
    } finally {
      isLoading.value = false;
    }
  }

  void applyToJob(int id) {
    Get.snackbar('Apply', 'Applied to job id: $id',
        snackPosition: SnackPosition.BOTTOM);
  }

  Future<void> saveJobs(jobId) async {
    try {
      NetworkResponse response =
      await NetworkCaller().postRequest(
        url: Urls.saveJobs,
        body: {"jobId": jobId},
      );
      if (response.isSuccess) {
        final favoriteJobsController = Get.find<SeekersSavedJobsController>();
        await favoriteJobsController.getSavedJobs();
        favoriteJobs.value = favoriteJobsController.savedJobs;
        favoriteJobs.refresh();
      } else {
        throw "Save failed";
        // showSnackBar(false, 'Save Failed');
      }
    } catch (e) {
      print("JOB SAVE UNSUCCESSFUL: ${e.toString()}");
      // showSnackBar(false, 'Job Save Unsuccessful');
    }
  }
}

