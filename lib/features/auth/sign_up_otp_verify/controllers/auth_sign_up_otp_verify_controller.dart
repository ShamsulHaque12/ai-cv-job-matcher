import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../sign_up_screen/controllers/auth_sign_up_screen_controller.dart';

class AuthSignUpOtpVerifyController extends GetxController {
  final AuthSignUpScreenController controller = Get.find();
  final pinController = TextEditingController();
  var otpCode = ''.obs;
  final seconds = 60.obs;
  var isLoading = false.obs;
  Timer? timer;
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    seconds.value = 60;
    timer?.cancel();
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      if (seconds.value > 0) {
        seconds.value--;
      } else {
        t.cancel();
      }
    });
  }

  /// Integrated Resend OTP API.....................................
  Future<void> resendCode() async {
    if (seconds.value != 0) return;

    isLoading.value = true;

    try {
      final data = {
        "userId": controller.registerId.value,
      };

      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.resendOtpSeekers,
        body: data,
      );

      if (response.isSuccess) {
        Get.snackbar(
          "Success",
          "A new OTP has been sent ✅",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        startTimer();
      } else {
        Get.snackbar(
          "Failed",
          response.errorMessage ?? "Could not resend OTP",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("OTP resend error: $e");
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again!",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Integrated Verify OTP API.....................................
  Future<void> verifySeekarsOtp(String otpCode) async {
    isLoading.value = true;
    try {
      final data = {
        "userId": controller.registerId.value,
        "otpCode": otpCode,
      };

      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.verifySeekers,
        body: data,
      );

      if (response.isSuccess) {
        Get.snackbar(
          "Success",
          "Your account has been verified",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed(Routes.AUTH_LOGIN_SCREEN);
      } else {
        Get.snackbar(
          "Error",
          "sry not verified",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Verify reset Seekers Otp............
  Future<void> verifyRestOtp(String otpCode) async {
    isLoading.value = true;
    try {
      final data = {
        "userId": controller.registerId.value,
        "otpCode": otpCode,
      };

      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.resendOtpVerifySeekers,
        body: data,
      );

      if (response.isSuccess) {
        Get.snackbar(
          "Success",
          "Your account has been verified",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed(Routes.AUTH_LOGIN_SCREEN);
      } else {
        Get.snackbar(
          "Error",
          "sry not verified",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading.value = false;
    }
  }



  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
