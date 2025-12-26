import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/shared_preferences_helper.dart';
import '../model/profile_model.dart';
import '../views/parse_preview_screen.dart';
import '../widget/certification_contrller.dart';

class AuthUploadResumeController extends GetxController {
  final isLoading = false.obs;
  Rx<File?> selectedFile = Rx<File?>(null);
  RxString fileName = ''.obs;
  RxString fileSize = ''.obs;
  RxString fileType = ''.obs;
  RxMap<String, dynamic> parsedData = <String, dynamic>{}.obs;

  final picker = ImagePicker();

  // Pick file
  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'jpg', 'png'],
    );

    if (result != null && result.files.single.path != null) {
      File file = File(result.files.single.path!);
      int size = file.lengthSync();

      if (size <= 10 * 1024 * 1024) {
        selectedFile.value = file;
        fileName.value = result.files.single.name;
        fileSize.value = '${(size / 1024).toStringAsFixed(1)} KB';
        fileType.value = 'document';
      } else {
        Get.snackbar('Error', 'File must be less than 10MB');
      }
    }
  }

  // Take photo
  Future<void> takePhoto() async {
    final XFile? image = await picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      File file = File(image.path);
      int size = file.lengthSync();

      if (size <= 10 * 1024 * 1024) {
        selectedFile.value = file;
        fileName.value = 'Captured Photo';
        fileSize.value = '${(size / 1024).toStringAsFixed(1)} KB';
        fileType.value = 'photo';
      } else {
        Get.snackbar('Error', 'Photo must be less than 10MB');
      }
    }
  }

  // Upload file to AI API
  Future<void> uploadFileToAI() async {
    if (selectedFile.value == null) {
      Get.snackbar('Error', 'Please select a file first');
      return;
    }

    try {
      isLoading.value = true;
      var file = selectedFile.value!;
      final mimeType = lookupMimeType(file.path) ?? 'application/octet-stream';
      final typeParts = mimeType.split('/');

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://206.162.244.134:8008/parse-resume'),
      );

      request.files.add(
        await http.MultipartFile.fromPath(
          'file',
          file.path,
          contentType: http.MediaType(typeParts[0], typeParts[1]),
        ),
      );

      request.headers.addAll({'Content-Type': 'multipart/form-data'});

      var response = await request.send();
      var respStr = await response.stream.bytesToString();
      isLoading.value = false;

      print('Server response: $respStr');

      if (response.statusCode == 200) {
        try {
          parsedData.value = jsonDecode(respStr);

          // parsedData থেকে ProfileModel তৈরি
          ProfileModel profile = ProfileModel.fromJson(parsedData);

          // Controller এ set করা
          setProfile(profile);

          Get.snackbar('Success', 'Resume parsed successfully!');

          Get.to(() => ProfileEditScreen());
        } catch (e) {
          Get.snackbar('Error', 'Invalid response format');
        }
      } else {
        Get.snackbar(
          'Error',
          'Failed to parse resume (${response.statusCode})',
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Something went wrong: $e');
    }
  }

  // Main fields
  var nameController = TextEditingController();
  var designationController = TextEditingController();
  var profileInfoController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var presentSalary = TextEditingController();
  var expectedSalary = TextEditingController();
  var countryRegionController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var zipCodeController = TextEditingController();
  var aboutMe = TextEditingController();
  // Dynamic lists
  var skillControllers = <TextEditingController>[].obs;
  var languageControllers = <TextEditingController>[].obs;

  // Nested dynamic lists
  var educationControllers = <EducationController>[].obs;
  var experienceControllers = <ExperienceController>[].obs;
  var otherLinkControllers = <OtherLinkController>[].obs;
  var certificationControllers = <CertificationController>[].obs;

  // Model reference
  late ProfileModel profile;

  // API থেকে data set করা
  void setProfile(ProfileModel profileData) {
    profile = profileData;

    // Main fields
    nameController.text = profile.name ?? '';
    designationController.text = profile.designation ?? '';
    profileInfoController.text = profile.profileDetailedInformation ?? '';

    final contact = profile.contactInfo?.isNotEmpty == true
        ? profile.contactInfo![0]
        : null;
    emailController.text = contact?.email ?? '';
    phoneController.text = contact?.phone ?? '';
    addressController.text = contact?.address ?? '';

    // Skills
    // skillControllers.clear();
    if (profile.skills != null && profile.skills!.isNotEmpty) {
      skillControllers.addAll(
        profile.skills!.map((skill) => TextEditingController(text: skill)),
      );
    } else {
      skillControllers.add(TextEditingController());
    }

    // Languages
   // languageControllers.clear();
    if (profile.languages != null && profile.languages!.isNotEmpty) {
      languageControllers.addAll(
        profile.languages!.map((lang) => TextEditingController(text: lang)),
      );
    } else {
      languageControllers.add(TextEditingController());
    }

    // Education
   // educationControllers.clear();
    if (profile.education != null && profile.education!.isNotEmpty) {
      educationControllers.addAll(
        profile.education!.map((e) => EducationController.fromEducation(e)),
      );
    } else {
      educationControllers.add(EducationController());
    }

    // Experience
   // experienceControllers.clear();
    if (profile.experience != null && profile.experience!.isNotEmpty) {
      experienceControllers.addAll(
        profile.experience!.map((e) => ExperienceController.fromExperience(e)),
      );
    } else {
      experienceControllers.add(ExperienceController());
    }

    // Other Links
    //otherLinkControllers.clear();
    if (profile.otherLinks != null && profile.otherLinks!.isNotEmpty) {
      otherLinkControllers.addAll(
        profile.otherLinks!.map((e) => OtherLinkController.fromOtherLink(e)),
      );
    } else {
      otherLinkControllers.add(OtherLinkController());
    }
  }

  // Remove file
  void removeFile() {
    selectedFile.value = null;
    fileName.value = '';
    fileSize.value = '';
    fileType.value = '';
  }

  Future<void> submitUpdatedProfile() async {
    try {
      isLoading.value = true;

      final response = await http.post(
        Uri.parse(Urls.profileCreate), // server URL
        headers: {
          'Authorization':
              'Bearer ${await SharedPreferencesHelper.getAccessToken()}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "phone": phoneController.text,
          "email": emailController.text,
          "country": countryRegionController.text,
          "address": addressController.text,
          "city": cityController.text,
          "state": stateController.text,
          "zipCode": zipCodeController.text,
          "job_title": designationController.text,
          "jobDescription": profileInfoController.text,
          "aboutMe": aboutMe.text,
          "skills": skillControllers.map((c) => c.text).toList(),
          "languages": languageControllers.map((c) => c.text).toList(),
          "experiences": experienceControllers
              .map((c) => c.toExperience())
              .toList(),
          "education": educationControllers
              .map((c) => c.toEducation())
              .toList(),
          "certifications": certificationControllers
              .map((c) => c.toCertification())
              .toList(),
          "present_salary": int.parse(presentSalary.text),
          "expected_salary": int.parse(expectedSalary.text),
          "socialMedia": otherLinkControllers
              .map((c) => c.toOtherLink())
              .toList(),
        }),
      );
      isLoading.value = false;
      print(await SharedPreferencesHelper.getAccessToken());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log("body: ${response.body}");
        Get.snackbar(
          'Success',
          'Profile updated successfully',
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        Get.offAllNamed(Routes.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN);
      } else {
        log("error: ${response.body}");
        Get.snackbar(
          'Error',
          'Failed to update profile: ${response.statusCode}',
        );
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', 'Something went wrong: $e');
    }
  }
}

// Nested controllers
class EducationController {
  var institutionController = TextEditingController();
  var degreeController = TextEditingController();
  var fieldController = TextEditingController();
  var resultsController = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();

  EducationController();

  EducationController.fromEducation(Education edu) {
    institutionController.text = edu.institution ?? '';
    degreeController.text = edu.degree ?? '';
    fieldController.text = edu.fieldOfStudy ?? '';
    resultsController.text = edu.results ?? '';
    startController.text = edu.startDate ?? '';
    endController.text = edu.endDate ?? '';
  }

  Education toEducation() {
    return Education(
      institution: institutionController.text,
      degree: degreeController.text,
      fieldOfStudy: fieldController.text,
      results: resultsController.text,
      startDate: startController.text,
      endDate: endController.text,
    );
  }
}
class ExperienceController {
  var companyController = TextEditingController();
  var designationController = TextEditingController();
  var detailsController = TextEditingController();
  var startController = TextEditingController();
  var endController = TextEditingController();

  ExperienceController();
  ExperienceController.fromExperience(Experience exp) {
    companyController.text = exp.company ?? '';
    designationController.text = exp.designation ?? '';
    detailsController.text = exp.details ?? '';
    startController.text = exp.startDate ?? '';
    endController.text = exp.endDate ?? '';
  }

  Experience toExperience() {
    return Experience(
      company: companyController.text,
      designation: designationController.text,
      details: detailsController.text,
      startDate: startController.text,
      endDate: endController.text,
    );
  }
}

class OtherLinkController {
  var linkTypeController = TextEditingController();
  var urlController = TextEditingController();

  OtherLinkController();

  OtherLinkController.fromOtherLink(OtherLink link) {
    linkTypeController.text = link.linkType ?? '';
    urlController.text = link.url ?? '';
  }

  OtherLink toOtherLink() {
    return OtherLink(
      linkType: linkTypeController.text,
      url: urlController.text,
    );
  }
}
