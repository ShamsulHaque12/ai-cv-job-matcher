import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../employer_auth/auth/individual_sign_up_screen/model/register_individual.dart';

class AuthSignUpScreenController extends GetxController {
  var passwordVisible = true.obs;
  var passwordConfirmVisible = true.obs;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passConfirmController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  final registerId = ''.obs;

  Future<void> signUpSeekers() async {
    /// Validate empty fields
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        passConfirmController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "All fields are required",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    /// Validate password match
    if (passwordController.text.trim() !=
        passConfirmController.text.trim()) {
      Get.snackbar(
        "Error",
        "Password and Confirm Password do not match",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    /// ✅ Successful - Start API process here
    try {
      isLoading.value = true;
      final data = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "role": "JOB_SEEKER",
      };
      log("Enterprise Url: ${Urls.registerSeekers}");
      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.registerSeekers,
        body: data,
      );
      if (response.isSuccess && response.responseData != null) {
        RegisterIndividual model = RegisterIndividual.fromJson(
          response.responseData!,
        );

        registerId.value = model.data?.id ?? '';

        showSnackBar(true, model.message ?? 'Registration successful');
        log("Register ID => ${registerId.value}");

          Get.toNamed(Routes.AUTH_SIGN_UP_OTP_VERIFY,arguments: emailController.text);

      } else {
        showSnackBar(false, response.errorMessage);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
