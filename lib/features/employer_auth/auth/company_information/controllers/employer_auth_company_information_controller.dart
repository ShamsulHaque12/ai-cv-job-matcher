import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import '../../../../../routes/app_pages.dart';
import '../../../../../services/api_endpoints.dart';
import '../../../../../services/network_caller.dart';
import '../model/get_my_company.dart';

class EmployerAuthCompanyInformationController extends GetxController {

  /// ✅ Text Controllers
  final companyNameController = TextEditingController();
  final roleController = TextEditingController();
  final zipCodeController = TextEditingController();
  final websiteController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final industryController = TextEditingController();
  final descriptionController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final countryController = TextEditingController();

  /// ✅ Loading State
  var isLoading = false.obs;
  var showNoCompanyPopup = false.obs;

  //..........Update Compmanu logo.......
  final ImagePicker _picker = ImagePicker();
  final selectedImage = Rx<File?>(null);

  /// Pick Image From Gallery
  Future<void> pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
      } else {
        showSnackBar(false, "No Image Selected");
      }
    } catch (e) {
      log("Image Picker Error: $e");
      showSnackBar(false, "Image picker failed!");
    }
  }

  /// Upload Company Logo
  Future<void> uploadLogo() async {
    if (selectedImage.value == null) {
      showSnackBar(false, "Please upload your company logo");
      return;
    }

    try {
      isLoading.value = true;

      final imageFile = selectedImage.value!;
      final multipartFile = await http.MultipartFile.fromPath(
        "logo",
        imageFile.path,
      );

      final response = await NetworkCaller().multipartRequest(
        url: Urls.logo,
        method: "PATCH",
        files: [multipartFile],
      );

      if (response.isSuccess) {
        Logger().i("Response: ${response.responseData}");
        showSnackBar(true, "Logo Updated Successfully ✔");
      } else {
        showSnackBar(false, response.errorMessage);
      }
    } catch (e) {
      log("Upload Error: $e");
      showSnackBar(false, "Failed to upload logo!");
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ This will store API response data including Company ID
  final myCompany = Rxn<GetMyCompany>();

  /// ------------------ CREATE COMPANY ------------------
  Future<void> createCompany() async {
    if (companyNameController.text.isEmpty ||
        roleController.text.isEmpty ||
        zipCodeController.text.isEmpty ||
        websiteController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        addressController.text.isEmpty ||
        industryController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        cityController.text.isEmpty ||
        stateController.text.isEmpty ||
        countryController.text.isEmpty ||
        selectedImage.value == null) {
      Get.snackbar(
        'Error',
        'All fields are required!',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      final data = {
        "companyName": companyNameController.text,
        "industryType": industryController.text,
        "roleInCompany": roleController.text,
        "description": descriptionController.text,
        "country": countryController.text,
        "email": emailController.text,
        "phoneNumber": phoneController.text,
        "address": addressController.text,
        "city": cityController.text,
        "state": stateController.text,
        "zipCode": zipCodeController.text,
        "website": websiteController.text,
      };

      NetworkResponse response = await NetworkCaller()
          .postRequest(url: Urls.company, body: data);

      if (response.isSuccess) {
        Get.snackbar(
          "Success",
          "Company created successfully!",
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        /// ✅ After creating company -> fetch ID
        await getMyCompanys();

        /// Navigate after success
        Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      } else {
        Get.snackbar(
          "Error",
          "Failed to create company!",
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("Error creating company: $e");
    } finally {
      isLoading.value = false;
    }
  }


  /// ------------------- GET MY COMPANY --------------------
  Future<void> getMyCompanys() async {
    try {
      isLoading.value = true;

      NetworkResponse response =
      await NetworkCaller().getRequest(url: Urls.getMycompany);

      if (response.isSuccess) {
        Logger().i("MyCompany Response: ${response.responseData}");

        myCompany.value = GetMyCompany.fromJson(response.responseData!);

        if (myCompany.value?.data == null) {
          showNoCompanyPopup.value = true;
        } else {
          showNoCompanyPopup.value = false;
        }

        /// ✅ Print ID on success
        log("✅ Company ID Loaded: ${myCompany.value?.data?.id}");
      } else {
        if (response.statusCode == 404) {
          showNoCompanyPopup.value = true;
        } else {
          log("Error loading my company: ${response.errorMessage}");
        }
      }
    } catch (e) {
      log("Error loading my company: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// ✅ Easy Access Getter for Company ID ( Anywhere Use )
  String? get companyId => myCompany.value?.data?.id;
}
