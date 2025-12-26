import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:http/http.dart' as http;
import 'package:jobly_ai/services/shared_preferences_helper.dart';
import 'package:logger/logger.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.responseData,
    this.errorMessage = 'Something went wrong',
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  /// Safely decode JSON, return null if not JSON
  Map<String, dynamic>? _tryDecode(String body) {
    try {
      return jsonDecode(body);
    } catch (_) {
      return null;
    }
  }

  /// GET request
  Future<NetworkResponse> getRequest({
    required String url,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      if (queryParams != null && queryParams.isNotEmpty) {
        uri = uri.replace(
          queryParameters: queryParams.map((k, v) => MapEntry(k, v.toString())),
        );
      }

      Map<String, String> finalHeaders = {
        // 'Authorization': await SharedPreferencesHelper.getAccessToken() ?? '',
        'Authorization' : 'Bearer ${await SharedPreferencesHelper.getAccessToken() ?? ''}',
        ...?headers,
      };

      _logRequest(uri.toString(), finalHeaders);

      http.Response response = await http.get(uri, headers: finalHeaders);

      _logResponse(uri.toString(), response);

      Map<String, dynamic>? decodeData = _tryDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else {
        String errorMsg =
            decodeData?['message'] ??
                'Server returned status code ${response.statusCode}';
        showSnackBar(false, errorMsg);

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: errorMsg,
          responseData: decodeData,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// POST request
  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      Uri uri = Uri.parse(url).replace(
        queryParameters: queryParams?.map((k, v) => MapEntry(k, v.toString())),
      );

      Map<String, String> finalHeaders = {
        'content-type': 'application/json',
        // 'Authorization': await SharedPreferencesHelper.getAccessToken() ?? '',
        'Authorization' : 'Bearer ${await SharedPreferencesHelper.getAccessToken() ?? ''}',
        ...?headers,
      };

      _logRequest(url, finalHeaders, requestBody: body);

      http.Response response = await http.post(
        uri,
        headers: finalHeaders,
        body: body != null ? jsonEncode(body) : null,
      );

      _logResponse(url, response);

      Map<String, dynamic>? decodeData = _tryDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201 || response.statusCode==308) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else {
        String errorMsg =
            decodeData?['message'] ??
                'Server returned status code ${response.statusCode}';
        showSnackBar(false, errorMsg);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: errorMsg,
          responseData: decodeData,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

// MULTIPART request (for file uploads)
  Future<NetworkResponse> multipartRequest({
    required String url,
    Map<String, String>? fields,
    Map<String, String>? headers,
    List<http.MultipartFile>? files,
    String method = 'PATCH',
  }) async {
    try {
      Uri uri = Uri.parse(url);

      Map<String, String> finalHeaders = {
        'Authorization': 'Bearer ${await SharedPreferencesHelper.getAccessToken() ?? ''}',
        ...?headers,
      };

      var request = http.MultipartRequest(method, uri);
      request.headers.addAll(finalHeaders);

      if (fields != null) {
        request.fields['data'] = jsonEncode(fields); // ✅ IMPORTANT!
      }

      if (files != null) {
        request.files.addAll(files);
      }

      var response = await http.Response.fromStream(await request.send());
      Map<String, dynamic>? decodeData = _tryDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      }

      showSnackBar(false, decodeData?['message'] ?? 'Failed');
      return NetworkResponse(
        statusCode: response.statusCode,
        isSuccess: false,
        errorMessage: decodeData?['message'] ?? 'Failed',
      );
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// PUT request
  Future<NetworkResponse> putRequest({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      Map<String, String> finalHeaders = {
        'content-type': 'application/json',
        // 'Authorization': await SharedPreferencesHelper.getAccessToken() ?? '',
        'Authorization' : 'Bearer ${await SharedPreferencesHelper.getAccessToken() ?? ''}',
        ...?headers,
      };

      _logRequest(url, finalHeaders, requestBody: body);

      http.Response response = await http.put(
        uri,
        headers: finalHeaders,
        body: body != null ? jsonEncode(body) : null,
      );

      _logResponse(url, response);

      Map<String, dynamic>? decodeData = _tryDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else {
        String errorMsg =
            decodeData?['message'] ??
                'Server returned status code ${response.statusCode}';
        showSnackBar(false, errorMsg);

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: errorMsg,
          responseData: decodeData,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// PATCH request
  Future<NetworkResponse> patchRequest({
    required String url,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      Map<String, String> finalHeaders = {
        'content-type': 'application/json',
        // 'Authorization': await SharedPreferencesHelper.getAccessToken() ?? '',
        'Authorization' : 'Bearer ${await SharedPreferencesHelper.getAccessToken() ?? ''}',
        ...?headers,
      };

      _logRequest(url, finalHeaders, requestBody: body);

      http.Response response = await http.patch(
        uri,
        headers: finalHeaders,
        body: body != null ? jsonEncode(body) : null,
      );

      _logResponse(url, response);

      Map<String, dynamic>? decodeData = _tryDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else {
        String errorMsg =
            decodeData?['message'] ??
                'Server returned status code ${response.statusCode}';
        showSnackBar(false, errorMsg);

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: errorMsg,
          responseData: decodeData,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// DELETE request
  Future<NetworkResponse> deleteRequest({
    required String url,
    Map<String, String>? headers,
  }) async {
    try {
      Uri uri = Uri.parse(url);

      Map<String, String> finalHeaders = {
        'content-type': 'application/json',
        // 'Authorization': await SharedPreferencesHelper.getAccessToken() ?? '',
        'Authorization' : 'Bearer ${await SharedPreferencesHelper.getAccessToken() ?? ''}',
        ...?headers,
      };

      _logRequest(url, finalHeaders);

      http.Response response = await http.delete(uri, headers: finalHeaders);

      _logResponse(url, response);

      Map<String, dynamic>? decodeData = _tryDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else {
        String errorMsg =
            decodeData?['message'] ??
                'Server returned status code ${response.statusCode}';
        showSnackBar(false, errorMsg);

        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: errorMsg,
          responseData: decodeData,
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  /// Logging
  void _logRequest(
      String url,
      Map<String, dynamic> headers, {
        Map<String, dynamic>? requestBody,
      }) {
    _logger.i('URL => $url\nHeaders => $headers\nRequest Body => $requestBody');
  }

  void _logResponse(String url, http.Response response) {
    _logger.i(
      'URL => $url\nStatus Code => ${response.statusCode}\nHeaders => ${response.headers}\nBody => ${response.body}',
    );
  }
}

//..........show snakbar..
void showSnackBar(bool isSuccess, String message) {
  Get.snackbar(
    isSuccess ? "Success" : "Error",
    message,
    snackPosition: SnackPosition.TOP,
    backgroundColor: isSuccess ? Colors.green : Colors.red,
    colorText: Colors.white,
    duration: const Duration(seconds: 2),
  );
}
