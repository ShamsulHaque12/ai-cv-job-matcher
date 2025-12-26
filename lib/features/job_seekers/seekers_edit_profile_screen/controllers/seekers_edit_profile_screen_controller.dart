import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../../services/shared_preferences_helper.dart';
import '../../../auth/upload_resume/controllers/auth_upload_resume_controller.dart';
import '../../../auth/upload_resume/widget/certification_contrller.dart';

class SeekersEditProfileScreenController extends GetxController {
  final isLoading = false.obs;
  final isSubmitButton = false.obs;

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

  @override
  void onInit() {
    super.onInit();
    fetchAllData();
  }

  Future<void> fetchAllData() async {
    try {
      isLoading.value = true;

      NetworkResponse response =
      await NetworkCaller().getRequest(url: Urls.getMyJobSeekerProfile);

      if (response.isSuccess) {
        final data = response.responseData?['data'] ?? {};
        // --- Main Fields ---
        designationController.text = data['JobTitle'] ?? '';
        profileInfoController.text = data['jobDescription'] ?? '';
        aboutMe.text = data['aboutMe'] ?? '';
        emailController.text = data['email'] ?? '';
        phoneController.text = data['phoneNumber'] ?? '';
        addressController.text = data['address'] ?? '';
        countryRegionController.text = data['countryRegion'] ?? '';
        cityController.text = data['city'] ?? '';
        stateController.text = data['state'] ?? '';
        zipCodeController.text = data['zipCode'] ?? '';
        presentSalary.text =
        data['presentSalary'] != null ? data['presentSalary'].toString() : '';
        expectedSalary.text =
        data['expectedSalary'] != null ? data['expectedSalary'].toString() : '';

        // --- Skills ---
        skillControllers.clear();
        if (data['skills'] != null && (data['skills'] as List).isNotEmpty) {
          skillControllers.addAll(
            (data['skills'] as List)
                .map((e) => TextEditingController(text: e)),
          );
        } else {
          skillControllers.add(TextEditingController());
        }

        // --- Languages ---
        languageControllers.clear();
        if (data['languages'] != null && (data['languages'] as List).isNotEmpty) {
          languageControllers.addAll(
            (data['languages'] as List)
                .map((e) => TextEditingController(text: e)),
          );
        } else {
          languageControllers.add(TextEditingController());
        }

        // --- Education ---
        educationControllers.clear();
        if (data['education'] != null && (data['education'] as List).isNotEmpty) {
          educationControllers.addAll(
            (data['education'] as List).map(
                  (edu) => EducationController()
                ..institutionController.text = edu['institution'] ?? ''
                ..degreeController.text = edu['degree'] ?? ''
                ..fieldController.text = edu['education'] ?? ''
                ..startController.text = edu['startYear'] ?? ''
                ..endController.text = edu['endYear'] ?? '',
            ),
          );
        } else {
          educationControllers.add(EducationController());
        }

        // --- Experience ---
        experienceControllers.clear();
        if (data['jobExperience'] != null &&
            (data['jobExperience'] as List).isNotEmpty) {
          experienceControllers.addAll(
            (data['jobExperience'] as List).map(
                  (exp) => ExperienceController()
                ..companyController.text = exp['company'] ?? ''
                ..designationController.text = exp['position'] ?? ''
                ..detailsController.text = exp['description'] ?? ''
                ..startController.text = exp['startDate'] ?? ''
                ..endController.text = exp['endDate'] ?? '',
            ),
          );
        } else {
          experienceControllers.add(ExperienceController());
        }

        // --- Certifications ---
        certificationControllers.clear();
        if (data['certifications'] != null &&
            (data['certifications'] as List).isNotEmpty) {
          certificationControllers.addAll(
            (data['certifications'] as List).map(
                  (cert) => CertificationController()
                ..titleController.text = cert['title'] ?? ''
                ..issuerController.text = cert['issuer'] ?? ''
                ..yearController.text = cert['year'] ?? '',
            ),
          );
        } else {
          certificationControllers.add(CertificationController());
        }

        // --- Other Links / Social Media ---
        otherLinkControllers.clear();
        if (data['socialMedia'] != null &&
            (data['socialMedia'] as List).isNotEmpty) {
          otherLinkControllers.addAll(
            (data['socialMedia'] as List).map(
                  (link) => OtherLinkController()
                ..linkTypeController.text = link['link_type'] ?? ''
                ..urlController.text = link['url'] ?? '',
            ),
          );
        } else {
          otherLinkControllers.add(OtherLinkController());
        }
      } else {
        showSnackBar(false, "Failed to fetch profile data");
      }
    } catch (e) {
      showSnackBar(false, e.toString());
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> updateMYProfile() async {
    final id = await SharedPreferencesHelper.getUserId();
    try {
      isSubmitButton.value = true;
      NetworkResponse response =
      await NetworkCaller().patchRequest(
        url: Urls.updateResume(id?? ""),
         body:{
      "phoneNumber": phoneController.text,
      "email": emailController.text,
      "countryRegion": countryRegionController.text,
      "address": addressController.text,
      "city": cityController.text,
      "state": stateController.text,
      "zipCode": zipCodeController.text,

      "JobTitle": designationController.text,

      "jobDescription": profileInfoController.text,
      "aboutMe": aboutMe.text,

      "skills": skillControllers.map((c) => c.text).toList(),
      "languages": languageControllers.map((c) => c.text).toList(),

      "jobExperience": experienceControllers.map((c) => {
      "company": c.companyController.text,
      "position": c.designationController.text,
      "startDate": c.startController.text,
      "endDate": c.endController.text,
      "description": c.detailsController.text
      }).toList(),

      "education": educationControllers.map((c) => {
      "degree": c.degreeController.text,
      "institution": c.institutionController.text,
      "startYear": c.startController.text,
      "endYear": c.endController.text
      }).toList(),

      "certifications": certificationControllers.map((c) => {
      "title": c.titleController.text,
      "issuer": c.issuerController.text,
      "year": c.yearController.text,
      }).toList(),

      "presentSalary": int.parse(presentSalary.text),
      "expectedSalary": int.parse(expectedSalary.text),

      "socialMedia": otherLinkControllers.map((c) => {
      "link_type": c.linkTypeController.text,
      "url": c.urlController.text
      }).toList(),
      }
    );

      if (response.isSuccess) {
        final data = response.responseData;
       showSnackBar(true, data?['message']);
      }else{
        showSnackBar(true, 'Failed to update profile');
      }
    } catch (e) {
      showSnackBar(false, e.toString());
    } finally {
      isSubmitButton.value = false;
    }
  }

}
