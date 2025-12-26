import 'package:get/get.dart';

class EditSecurityController extends GetxController {
  RxBool faceEnabled = true.obs;
  RxBool remembarEnabled = true.obs;
  RxBool touchEnabled = false.obs;

  void toggleFace(bool value) => faceEnabled.value = value;
  void toggleRemembar(bool value) => remembarEnabled.value = value;
  void toggleTouch(bool value) => touchEnabled.value = value;
}