import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../employer_auth/auth/contact_information/model/show_me_result.dart';

class EditEmployerProfileController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final countryController = TextEditingController();

  var isLoading = false.obs;

  final ImagePicker _picker = ImagePicker();
  var selectedImage = Rx<File?>(null);

  /// Pick image from gallery
  Future<void> pickImage() async {
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

  @override
  void onInit() {
    super.onInit();
    showAllResult();
  }

  /// Submit profile section
  Future<void> submitProfileSection() async {
    if (selectedImage.value == null) {
      showSnackBar(false, "Upload your profile logo");
      return;
    }

    isLoading.value = true;

    try {
      var file = await http.MultipartFile.fromPath(
        "file",
        selectedImage.value!.path,
      );

      final response = await NetworkCaller().multipartRequest(
        url: Urls.editProfile,
        method: "PATCH",
        fields: {
          "name": nameController.text,
          "email": emailController.text,
          "country": countryController.text,
          "address": addressController.text,
        },
        files: [file],
      );

      isLoading.value = false;

      if (response.isSuccess) {
        log(response.responseData.toString());
        Logger().i("Response Data : ${response.responseData}");
        showSnackBar(true, "Updated Successfully ✅");
        showAllResult();
        Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      } else {
        showSnackBar(false, response.errorMessage);
      }
    } catch (e) {
      isLoading.value = false;
      showSnackBar(false, e.toString());
    }
  }

  /// Show all result
  final showMe = Rxn<showMeResult>();

  Future<void> showAllResult() async {
    try {
      isLoading.value = true;

      NetworkResponse response =
      await NetworkCaller().getRequest(url: Urls.authMe);

      if (response.isSuccess) {
        Logger().i("Response Data : ${response.responseData}");
        showMe.value = showMeResult.fromJson(response.responseData!);
      } else {
        showSnackBar(false, response.errorMessage);
      }
    } catch (e) {
      log("Error: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
