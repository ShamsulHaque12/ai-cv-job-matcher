import 'dart:convert';
import 'package:get/get.dart';
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../../services/shared_preferences_helper.dart';

class GmailSignUpOptionController extends GetxController {
  final isjobseekersSelected = false.obs;
  final isemployerSelected = false.obs;
  final isSelected = ''.obs;
  final idToken = ''.obs;
  final isLoading = false.obs;
  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) throw Exception('Invalid token');

    final payload = base64Url.normalize(parts[1]);
    final decoded = utf8.decode(base64Url.decode(payload));
    return json.decode(decoded);
  }
  @override
  void onInit() {
    super.onInit();
    idToken.value = Get.arguments ??  '';
  }
  void isIndividualSelect() async {
    isjobseekersSelected.value = true;
    isemployerSelected.value = false;
    await Future.delayed(Duration(microseconds: 300));
    isSelected.value = 'JOB_SEEKER';
    SignUpWithGoogle();
   // Get.toNamed(Routes.EMPLOYER_INDIVIDUAL_SIGN_UP_SCREEN);
  }
  void isenterpriseSelect() async {
    isjobseekersSelected.value = false;
    isemployerSelected.value = true;
    await Future.delayed(Duration(microseconds: 300));
    isSelected.value = 'EMPLOYEE';
    SignUpWithGoogle();
   // Get.toNamed(Routes.EMPLOYER_AUTH_ENTERPRISE_SIGN_UP_SCREEN);
  }

  Future<void> SignUpWithGoogle()async{
    isLoading.value = true;
    final NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.rollSelected,
        body: {
          "role": isSelected.value,
          "token": idToken.value
        }
    );
    if(response.isSuccess){
      final data = response.responseData?['data'];
      print('My data is: $data');
      SignUp();
    }else{
      Get.snackbar('Sign Up Failed', 'Please try again');
    }
  }

  Future<void> SignUp()async{
    final NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.gmailLogin,
        body: {
          "googleToken": idToken.value
        }
    );
    if(response.isSuccess){
      final token = response.responseData!["data"]["accessToken"];
      final decoded = parseJwt(token);
      final role = decoded["role"].toString();
      final userId = decoded["id"].toString();
      await SharedPreferencesHelper.saveAccessToken(token);
      await SharedPreferencesHelper.saveRole(role);
      await SharedPreferencesHelper.saveUserId(userId);
      if (role == "EMPLOYEE") {
         Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
      } else if (role == "JOB_SEEKER") {
         Get.offAllNamed(Routes.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN);
      }else {
        Get.snackbar(
          "Role Error ",
          "Invalid User Role",
          snackPosition: SnackPosition.TOP,
        );
      }
    }else{
      Get.snackbar('Sign Up Failed', 'Please try again');
    }
    isLoading.value = false;
  }


}
