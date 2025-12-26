import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';

class ChangePasswordController extends GetxController {
  var passwordVisible = true.obs;
  var passwordConfirmVisible = true.obs;
  var oldPasswordVisible = true.obs;

  final oldPasswordController = TextEditingController();
  final passConfirmController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;

  Future<void> changePassword() async {
    if (oldPasswordController.text.isEmpty ||
        passwordController.text.isEmpty ||
        passConfirmController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill all fields',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }
    if (passwordController.text != passConfirmController.text) {
      Get.snackbar(
        'Error',
        'Passwords do not match',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;
      NetworkResponse response = await NetworkCaller().putRequest(
        url: Urls.changePassword,
        body: {
          "currentPassword": oldPasswordController.text,
          "newPassword": passwordController.text,
          "confirmPassword": passConfirmController.text,
        },
      );
      if (response.isSuccess) {
        Get.snackbar(
          'Success',
          'Password changed successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.toNamed(Routes.BOTTOM_NAV_BAR);
      }else{
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
