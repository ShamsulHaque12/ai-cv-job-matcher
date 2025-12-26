import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../services/api_endpoints.dart';
import '../../../../services/network_caller.dart';
import '../../../../services/shared_preferences_helper.dart';

class SeekersProfileScreenController extends GetxController {
  final isLoading = false.obs;
  Rx<File?> pickedImage = Rx<File?>(null);

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      pickedImage.value = File(image.path);
      await uploadProfileImage(File(image.path));
    }
  }
  Future<void> uploadProfileImage(File file) async {
    try {
      isLoading(true);

      var request = http.MultipartRequest('PATCH', Uri.parse(Urls.updateProfile));
      request.files.add(await http.MultipartFile.fromPath('file', file.path));

      final token = await SharedPreferencesHelper.getAccessToken();
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }
      request.headers['Content-Type'] = 'multipart/form-data';
      final streamedResponse = await request.send();
      final responseString = await streamedResponse.stream.bytesToString();
      final responseData = json.decode(responseString);

      if (streamedResponse.statusCode >= 200 && streamedResponse.statusCode < 300) {
        final imageUrl = responseData['data']['profilePic'];
        if (imageUrl != null) {
          showSnackBar(true, 'Profile image updated successfully');
        } else {
          showSnackBar(false, 'No image URL returned from server');
        }
      } else {
        final message = responseData['message'] ?? 'Failed to upload image';
        showSnackBar(false, message);
      }
    } catch (e) {
      log('Image upload error: $e');
      showSnackBar(false, 'Failed to Upload Image. Please try again later.');
    } finally {
      isLoading(false);
    }
  }

}
