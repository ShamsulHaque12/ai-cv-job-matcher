import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../employer_auth/auth/individual_sign_up_screen/model/register_individual.dart';

class AuthForgotPasswordEmailScreenController extends GetxController {
  final emailController = TextEditingController();

  final registerId = ''.obs;
  var isLoading = false.obs;

  /// Forgot password
  Future<void> forgotPassword() async {
    if (emailController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please enter your email',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    try {
      isLoading.value = true;
      final data = {"email": emailController.text};
      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.forgotPassword,
        body: data,
      );
      if (response.isSuccess) {
        RegisterIndividual model = RegisterIndividual.fromJson(
          response.responseData!,
        );

        registerId.value = model.data?.id ?? '';

        log("Register ID => ${registerId.value}");
        Get.snackbar(
          'Success',
          response.responseData!['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        Get.toNamed(
          Routes.AUTH_FORGOT_PASSWORD_OTP_SCREEN,
          arguments: emailController.text,
        );
      } else {
        Get.snackbar(
          'Error',
          response.responseData!['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
