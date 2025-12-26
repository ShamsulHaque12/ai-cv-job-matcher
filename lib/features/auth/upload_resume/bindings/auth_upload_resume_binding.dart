import 'package:get/get.dart';

import '../controllers/auth_upload_resume_controller.dart';

class AuthUploadResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthUploadResumeController>(
      () => AuthUploadResumeController(),
    );
  }
}
