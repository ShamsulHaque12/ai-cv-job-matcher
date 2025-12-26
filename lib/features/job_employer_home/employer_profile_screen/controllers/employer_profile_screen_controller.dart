import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../edit_employer_profile/controllers/edit_employer_profile_controller.dart';

class EmployerProfileScreenController extends GetxController {
  final EditEmployerProfileController editEmployerProfileController =
      Get.find();
  // Rx<File?> pickedImage = Rx<File?>(null);

  @override
  void onInit() {
    editEmployerProfileController.showAllResult();
    super.onInit();
  }

  // Future<void> pickImage() async {
  //   final ImagePicker picker = ImagePicker();
  //   final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //
  //   if (image != null) {
  //     pickedImage.value = File(image.path);
  //     editEmployerProfileController.showAllResult();
  //   }
  // }
}
