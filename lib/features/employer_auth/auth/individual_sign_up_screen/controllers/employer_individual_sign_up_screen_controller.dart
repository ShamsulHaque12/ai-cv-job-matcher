import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../services/api_endpoints.dart';
import '../../../../../services/network_caller.dart';
import '../model/register_individual.dart';
import '../views/individual_otp_screen.dart';

class EmployerIndividualSignUpScreenController extends GetxController {
  final passwordVisible = false.obs;
  final confirmPasswordVisible = false.obs;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  final registerId = ''.obs;

  Future<void> signUpIndividual() async {
    /// Validate empty fields
    if (firstNameController.text.isEmpty ||
        lastNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
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
        confirmPasswordController.text.trim()) {
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
        "role": "EMPLOYEE",
        "employeType": "INDIVIDUAL",
      };
      log("Individual Url: ${Urls.registerIndividual}");
      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.registerIndividual,
        body: data,
      );
      if (response.isSuccess && response.responseData != null) {
        RegisterIndividual model = RegisterIndividual.fromJson(
          response.responseData!,
        );

        registerId.value = model.data?.id ?? '';

        showSnackBar(true, model.message ?? 'Registration successful');
        log("Register ID => ${registerId.value}");

        Get.to(() => IndividualOtpScreen(email: emailController.text));
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
