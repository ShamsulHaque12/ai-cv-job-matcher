import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // <-- for date formatting
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';

class ResumeDetailsScreenController extends GetxController {
  // Observables
  var statusController = ''.obs;
  var isInterviewSelected = false.obs;
  var selectedDate = ''.obs;
  var selectedTime = ''.obs;
  var selectedPlatform = 'GOOGLE_MEET'.obs;
  final textController = TextEditingController();
  final linkController = TextEditingController();
  final platfromController = TextEditingController();

  final isLoading = false.obs;

  String? seekerId;
  dynamic seeker;
  dynamic job;

  @override
  void onInit() {
    final args = Get.arguments as Map<String, dynamic>;
    seeker = args['seeker'];
    job = args['job'];
    seekerId = args['candidate'];
    super.onInit();
  }

  /// ✅ Send Application / Interview Request
  Future<void> sendApplicationByUser() async {
    if (seekerId == null) {
      Get.snackbar("Error", "Job or Seeker ID missing!");
      return;
    }

    try {
      isLoading.value = true;

      // Parse selected date
      DateTime? pickedDate;
      if (selectedDate.value.isNotEmpty) {
        pickedDate = DateFormat('dd-MM-yyyy').parse(selectedDate.value);
      }

      // Parse selected time
      TimeOfDay? pickedTime;
      if (selectedTime.value.isNotEmpty) {
        final timeParts = selectedTime.value.split(
          RegExp(r'[: ]'),
        ); // split hh:mm AM/PM
        int hour = int.parse(timeParts[0]);
        final minute = int.parse(timeParts[1]);
        final isPM = timeParts[2].toUpperCase() == 'PM';
        if (isPM && hour != 12) hour += 12;
        if (!isPM && hour == 12) hour = 0;
        pickedTime = TimeOfDay(hour: hour, minute: minute);
      }

      // Merge date + time
      DateTime? interviewDateTime;
      if (pickedDate != null && pickedTime != null) {
        interviewDateTime = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
          pickedTime.hour,
          pickedTime.minute,
        );
      }

      final data = {
        "jobApplicationId": seekerId,
        "interviewTitle": textController.text.trim(),
        "interviewDate": interviewDateTime?.toUtc().toIso8601String(),
        "interviewTime": interviewDateTime != null
            ? DateFormat('HH:mm').format(interviewDateTime)
            : null,
        "interviewPlatform": platfromController.text.trim(),
        "interviewLink": linkController.text.trim(),
      };

      log("📤 Sending application data: $data");

      final response = await NetworkCaller().postRequest(
        url: Urls.sendApplication,
        body: data,
      );

      if (response.isSuccess) {
        Get.snackbar(
          "Success",
          "Interview scheduled successfully!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        log("✅ Interview request sent successfully!");
      } else {
        log("❌ Failed to send interview request: ${response.errorMessage}");
        Get.snackbar(
          "Error",
          response.errorMessage ?? "Request failed!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("💥 Error in sendApplication: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Rejected Application
  Future<void> rejectApplications() async {
    if (seekerId == null) {
      Get.snackbar("Error", "Job or Seeker ID missing!");
      return;
    }
    try {
      isLoading.value = true;
      final data = {"status": statusController.value};
      final response = await NetworkCaller().patchRequest(
        url: "${Urls.regectedApplication}$seekerId/status",
        body: data,
      );
      if (response.isSuccess) {
        Get.snackbar(
          "Success",
          "Interview rejected successfully!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        log("✅ Interview rejected sent successfully!");
      } else {
        log(
          "❌ Failed to send rejected interview request: ${response.errorMessage}",
        );
        Get.snackbar(
          "Error",
          response.errorMessage ?? "Request failed!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("💥 Error in sendApplication: $e");
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
