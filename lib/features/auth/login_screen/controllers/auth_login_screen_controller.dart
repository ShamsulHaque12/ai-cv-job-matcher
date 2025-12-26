import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import '../../../../routes/app_pages.dart';
import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../../services/shared_preferences_helper.dart';

class AuthLoginScreenController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordVisible = true.obs;
  final googleIdToken = "".obs;
  var isLoading = false.obs;
  final gmailIsLoading = false.obs;
  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) throw Exception('Invalid token');

    final payload = base64Url.normalize(parts[1]);
    final decoded = utf8.decode(base64Url.decode(payload));
    return json.decode(decoded);
  }

  Future<void> loginUser() async {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      Get.snackbar(
        "Error",
        "Email and password required",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final data = {
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
      };

      NetworkResponse response = await NetworkCaller().postRequest(
        url: Urls.login,
        body: data,
      );

      if (response.isSuccess) {
        final token = response.responseData!["data"]["accessToken"];
        final decoded = parseJwt(token);
        final role = decoded["role"].toString();
        final userId = decoded["id"].toString();
        final isVerified = decoded["isVerified"] ?? false;

        /// ✅ Save token & role using helper
        await SharedPreferencesHelper.saveAccessToken(token);
        await SharedPreferencesHelper.saveRole(role);
        await SharedPreferencesHelper.saveUserId(userId);

        log("Decoded Role: $role");
        log("Is Verified: $isVerified");
        log("User Token : $token");

        if (!isVerified) {
          Get.snackbar(
            "Verification Required",
            "Please verify your account first!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
          return;
        }

        /// ✅ Login Success Snackbar
        Get.snackbar(
          "Success ✅",
          "Login successful!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        /// ✅ Navigate by role
        if (role == "EMPLOYEE") {
          Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
        } else if (role == "JOB_SEEKER") {
          Get.offAllNamed(Routes.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN);
        } else {
          Get.snackbar(
            "Role Error ",
            "Invalid User Role",
            snackPosition: SnackPosition.TOP,
          );
        }
      } else {
        Get.snackbar(
          "Login Failed ",
          response.errorMessage ?? "Something went wrong!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      log("Error: $e");
      Get.snackbar(
        "Exception ",
        e.toString(),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
///////////////////////////////////////////////////////////////////////////
//   final GoogleSignIn _googleSignIn = GoogleSignIn(
//     scopes: ['email', 'profile', 'openid'],
//     serverClientId: Platform.isAndroid? '961923354722-4ouo57bddaim3ah7u0tlqrlu5ti6rulm.apps.googleusercontent.com':'961923354722-3ck5agjrclce3l810bd7cuc0e32kdjip.apps.googleusercontent.com',
//   );


  // Future<void> loginWithGoogle() async {
  //   gmailIsLoading.value = true;
  //   try {
  //     final user = await _googleSignIn.signIn();
  //     if (user == null) {
  //       return;
  //     }
  //
  //     final auth = await user.authentication;
  //
  //     final idToken = auth.idToken;
  //     final accessToken = auth.accessToken;
  //     print('My id token: $idToken my accesstoken: $accessToken');
  //     final NetworkResponse response = await NetworkCaller().postRequest(
  //       url: Urls.gmailLogin,
  //       body: {
  //         "googleToken": idToken,
  //       },
  //     );
  //     if (response.isSuccess) {
  //       final data = response.responseData!["data"];
  //       final authType = data["authType"];
  //       final decoded = parseJwt(data["accessToken"]);
  //       final role = decoded["role"].toString();
  //       final userId = decoded["id"].toString();
  //       await SharedPreferencesHelper.saveAccessToken(data["accessToken"]);
  //       await SharedPreferencesHelper.saveRole(role);
  //       await SharedPreferencesHelper.saveUserId(userId);
  //       /// ✅ Navigate by role
  //       if(authType == "login"){
  //         if (role == "EMPLOYEE") {
  //           Get.offAllNamed(Routes.BOTTOM_NAV_BAR);
  //           Get.snackbar(
  //             "Success ✅",
  //             "Login successful!",
  //             snackPosition: SnackPosition.TOP,
  //             backgroundColor: Colors.green,
  //             colorText: Colors.white,
  //           );
  //         } else if (role == "JOB_SEEKER") {
  //           Get.offAllNamed(Routes.JOB_SEEKERS_BOTTOM_NAVBAR_SCREEN);
  //           Get.snackbar(
  //             "Success ✅",
  //             "Login successful!",
  //             snackPosition: SnackPosition.TOP,
  //             backgroundColor: Colors.green,
  //             colorText: Colors.white,
  //           );
  //         }
  //       }else {
  //         Get.toNamed(Routes.GMAIL_SIGNIN_OPTION,arguments: idToken.toString());
  //       }
  //     } else {
  //       Get.snackbar(
  //         "Login Failed ",
  //         response.errorMessage ?? "Something went wrong!",
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white,
  //       );
  //     }
  //
  //   } catch (e) {
  //     log("Error: $e");
  //     Get.snackbar(
  //       "Exception ",
  //       e.toString(),
  //       snackPosition: SnackPosition.TOP,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white,
  //     );
  //   }finally {
  //     gmailIsLoading.value = false;
  //   }
  // }

}
