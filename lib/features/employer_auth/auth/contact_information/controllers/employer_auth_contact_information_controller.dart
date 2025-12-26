import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../../../../../routes/app_pages.dart';
import '../../../../../services/api_endpoints.dart';
import '../../../../../services/network_caller.dart';

class EmployerAuthContactInformationController extends GetxController {
  final websiteController = TextEditingController();
  final phoneController = TextEditingController();
  var isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();
  var selectedImage = Rx<File?>(null);

 void pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      selectedImage.value = File(pickedFile.path);
    } else {
      log("No Image Selected");
    }
  }

  Future<void> submitContactInfo() async {
    if (selectedImage.value == null) {
      showSnackBar(false, "Upload your company logo");
      return;
    }

    isLoading.value = true;

    try {
      var file = await http.MultipartFile.fromPath(
        "file",
        selectedImage.value!.path,
      );

      final response = await NetworkCaller().multipartRequest(
        url: Urls.updateCompany,
        method: "PATCH",
        fields: {
          "phone": phoneController.text,
          "website": websiteController.text,
        },
        files: [file],
      );

      isLoading.value = false;

      if (response.isSuccess) {
        log(response.responseData.toString());
        Logger().i("Response Data : ${response.responseData}");
        showSnackBar(true, "Updated Successfully ✅");
        Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      } else {
        log("Error : ${response.errorMessage}");
        showSnackBar(false, response.errorMessage);
      }
    } catch (e) {
      log("Error : $e");
      showSnackBar(false, e.toString());
    }finally{
      isLoading.value = false;
    }
  }


}
