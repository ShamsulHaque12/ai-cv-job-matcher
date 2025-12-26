import 'package:get/get.dart';

class EditLanguageController extends GetxController {
  RxString selectedLanguage = 'English (US)'.obs;

  void selectLanguage(String language) {
    selectedLanguage.value = language;
  }
}