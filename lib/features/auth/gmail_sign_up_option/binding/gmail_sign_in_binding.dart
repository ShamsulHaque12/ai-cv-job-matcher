import 'package:get/get.dart';

import '../controller/gmail_sign_up_option_controller.dart';

class GmailSignInBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => GmailSignUpOptionController());
  }
}