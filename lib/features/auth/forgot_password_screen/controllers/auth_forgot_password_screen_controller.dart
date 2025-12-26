import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';

class AuthForgotPasswordScreenController extends GetxController {
  final passwordVisible = true.obs;
  final confirmPasswordVisible = true.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> resetPassword() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all the fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;

    }
    try{
      isLoading.value = true;
      final data = {
        "email": emailController.text,
        "newPassword": passwordController.text,
        "confirmPassword": confirmPasswordController.text,
      };

      NetworkResponse response = await NetworkCaller().patchRequest(
        url: Urls.resetPassword,
        body: data
      );

      if(response.isSuccess){
        Get.snackbar(
          'Success',
          'Password Restored Successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed(Routes.AUTH_LOGIN_SCREEN);
      }else{
        Get.snackbar(
          'Error',
          'Passwords not Restored',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

    }catch(e){
      log(e.toString());
    }finally{
      isLoading(false);
    }
  }
}
