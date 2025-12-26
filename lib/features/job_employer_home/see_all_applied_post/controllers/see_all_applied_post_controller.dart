import 'dart:developer';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../job_home_employer_screen/model/show_me_profile_data.dart';
import '../model/get_applied_post.dart';

class SeeAllAppliedPostController extends GetxController {
  final isLoading = false.obs;

  /// List of applied jobs
  final RxList<AppliedData> appliedJobPosts = <AppliedData>[].obs;
  final showMeProfile = Rxn<UserData>();

  @override
  void onInit() {
    super.onInit();
    getAppliedJobs();
  }

  /// Get applied jobs
  Future<void> getAppliedJobs() async {
    try {
      isLoading.value = true;

      final response = await NetworkCaller().getRequest(
        url: Urls.getAppliedJobs,
      );

      if (response.isSuccess && response.responseData != null) {
        final parsed = GetAppliedPost.fromJson(response.responseData!);
        appliedJobPosts.clear();
        if (parsed.data != null) {
          appliedJobPosts.addAll(parsed.data!);
          final jobSeekerId = parsed.data![0].jobSeekerId;
          // await getShowProfile(jobSeekerId!);
          log("JobSeeker ID: $jobSeekerId");
        } else {
          log("⚠️ Applied job data is null");
        }

        log("✅ Fetched ${appliedJobPosts.length} applied job posts");
      } else {
        log("❌ Failed to fetch applied jobs: ${response.errorMessage}");
      }
    } catch (e) {
      log("❌ Exception while fetching applied jobs: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch profile for a given JobSeeker ID
  // Future<void> getShowProfile(String jobSeekerId) async {
  //   try {
  //     isLoading.value = true;
  //
  //     final url = "${Urls.getMyJobSeekerProfile}/$jobSeekerId";
  //     log("Fetching profile from URL: $url");
  //
  //     NetworkResponse response = await NetworkCaller().getRequest(url: url);
  //
  //     if (response.isSuccess && response.responseData != null) {
  //       final parsed = ShowMeProfileData.fromJson(response.responseData!);
  //
  //       if (parsed.data != null) {
  //         showMeProfile.value = parsed.data!;
  //         log("✅ Profile fetched successfully: ${showMeProfile.value}");
  //       } else {
  //         log("⚠️ Profile data is null");
  //       }
  //     } else {
  //       log("❌ Failed to fetch profile: ${response.errorMessage}");
  //       log("jani na ki error");
  //     }
  //   } catch (e) {
  //     log("💥 Error in getShowProfile: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  /// Fetch Mobile Number
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri uri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      Get.snackbar("Error", "Could not launch dialer");
    }
  }
}
