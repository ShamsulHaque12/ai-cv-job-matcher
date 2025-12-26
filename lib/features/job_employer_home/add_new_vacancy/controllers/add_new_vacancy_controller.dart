
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNewVacancyController extends GetxController {
  // Form controllers
  final possitionController = TextEditingController();
  final experienceController = TextEditingController();
  final dedlineController = TextEditingController();
  final locationController = TextEditingController();
  final workingTimeController = TextEditingController();
  final descriptionController = TextEditingController();
  final salaryTypeController = TextEditingController();
  final jobTypeController = TextEditingController();
  final careerLevelController = TextEditingController();
  final workController = TextEditingController();
  final salaryController = TextEditingController();
  final typeController = TextEditingController();

  var isOtherSelected = false.obs;
  var otherTextController = TextEditingController();

  final isLoading = false.obs;

  // final ImagePicker _picker = ImagePicker();
  // final selectedImage = Rx<File?>(null);
  //
  // /// Pick Image From Gallery
  // Future<void> pickImage() async {
  //   try {
  //     final pickedFile = await _picker.pickImage(
  //       source: ImageSource.gallery,
  //       imageQuality: 80,
  //     );
  //
  //     if (pickedFile != null) {
  //       selectedImage.value = File(pickedFile.path);
  //     } else {
  //       showSnackBar(false, "No Image Selected");
  //     }
  //   } catch (e) {
  //     log("Image Picker Error: $e");
  //     showSnackBar(false, "Image picker failed!");
  //   }
  // }
  //
  // /// Upload Company Logo
  // Future<void> uploadLogo() async {
  //   if (selectedImage.value == null) {
  //     showSnackBar(false, "Please upload your company logo");
  //     return;
  //   }
  //
  //   try {
  //     isLoading.value = true;
  //
  //     final imageFile = selectedImage.value!;
  //     final multipartFile = await http.MultipartFile.fromPath(
  //       "logo",
  //       imageFile.path,
  //     );
  //
  //     final response = await NetworkCaller().multipartRequest(
  //       url: Urls.logo,
  //       method: "PATCH",
  //       files: [multipartFile],
  //     );
  //
  //     if (response.isSuccess) {
  //       Logger().i("Response: ${response.responseData}");
  //       showSnackBar(true, "Logo Updated Successfully ✔");
  //     } else {
  //       showSnackBar(false, response.errorMessage);
  //     }
  //   } catch (e) {
  //     log("Upload Error: $e");
  //     showSnackBar(false, "Failed to upload logo!");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

}
