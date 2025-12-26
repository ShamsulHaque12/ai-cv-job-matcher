import 'dart:developer';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../model/get_deshboard.dart';
import '../model/show_me_profile_data.dart';

class JobHomeSekerScreenController extends GetxController {
  final isLoading = false.obs;
  /// Dashboard data
  final dashboardData = Rxn<DashboardData>();
  /// Profile data
  final showMeProfile = Rxn<UserData>();

  @override
  void onInit() {
    super.onInit();
    fetchDashboardAndProfile();
  }

  /// Fetch dashboard and profile sequentially
  Future<void> fetchDashboardAndProfile() async {
    try {
      isLoading.value = true;

      // Fetch dashboard
      NetworkResponse response = await NetworkCaller().getRequest(
        url: Urls.dashboard,
      );

      if (response.isSuccess && response.responseData != null) {
        final parsed = GetDashboard.fromJson(response.responseData!);
        dashboardData.value = parsed.data;

        log("✅ Dashboard fetched successfully");

        // Get first recent candidate's job seeker ID
        final firstCandidateJobSeekerId =
            parsed.data?.recentCandidates.isNotEmpty == true
            ? parsed.data!.recentCandidates.first.jobSeeker?.id
            : null;

        if (firstCandidateJobSeekerId != null) {
          log("✅ Found JobSeeker ID: $firstCandidateJobSeekerId");
        } else {
          log("⚠️ No recent candidates found or JobSeeker ID is null");
        }
      } else {
        log("❌ Failed to fetch dashboard: ${response.errorMessage}");
      }
    } catch (e) {
      log("💥 Error in fetchDashboardAndProfile: $e");
    } finally {
      isLoading.value = false;
    }
  }
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
