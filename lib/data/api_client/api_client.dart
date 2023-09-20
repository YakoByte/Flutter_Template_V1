import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../application/dialog/dialod_service.dart';
import '../../utils/color.dart';

class ApiClient {
  ApiClient();

  Map<String, String> createHeaders({
    required String authtoken,
  }) {
    debugPrint("Token is=-=- $authtoken");
    final headers = <String, String>{
      "content-type": "application/json",
      "accept": "application/json",
       if (authtoken != "") 'Authorization': "Bearer $authtoken",
    };

    return headers;
  }

  Future<T?> postData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
  }) async {
    try {
      debugPrint("_postData URL=-=-=-=-::: $uri");
      debugPrint("_postData headers=-=-=-=-::: $headers");
      debugPrint("_postData body=-=-=-=-::: $body");
      var request = http.Request('POST', uri);
      request.body = json.encode(body);
      debugPrint('_postData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      debugPrint('response.statusCode is ${response.statusCode}');

      debugPrint("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        debugPrint("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["error"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        debugPrint("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-1 $e");
    }
  }

  Future<T?> deleteData<T>({
    required Uri uri,
    required var headers,
    required T Function(dynamic data) builder,
  }) async {
    try {
      debugPrint("deleteData URL=-=-=-=-::: $uri");
      debugPrint("deleteData headers=-=-=-=-::: $headers");

      var request = http.Request('DELETE', uri);
      debugPrint('_postData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      debugPrint('response.statusCode is ${response.statusCode}');

      debugPrint("response is=-=-$responseString");
      dynamic map = json.decode(responseString);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        debugPrint("response statusCode is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: map["error"] ?? response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        debugPrint("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-1 $e");
    }
  }

  Future<T?> getData<T>({
    required Uri uri,
    required var headers,
    required T Function(dynamic data) builder,
  }) async {
    try {
      debugPrint("_getData URL=-=-=-=-::: $uri");
      debugPrint("_getData headers=-=-=-=-::: $headers");
      var request = http.Request('GET', uri);
      debugPrint('_getData $uri body ${request.body}');
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      final responseString = await response.stream.bytesToString();
      debugPrint('response.statusCode is ${response.statusCode}');

      log("response is=-=-$responseString");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        debugPrint("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-4 $e");
    }
  }

  Future<T?> multipartData<T>({
    required Uri uri,
    required var headers,
    required var body,
    required T Function(dynamic data) builder,
    required var imageparam,
    required var imagepath,
  }) async {
    try {
      debugPrint("_multipartData URL=-=-=-=-::: $uri");
      debugPrint("_multipartData headers=-=-=-=-::: $headers");
      debugPrint("_multipartData body=-=-=-=-::: $body");
      var request = http.MultipartRequest('POST', uri);
      request.fields.addAll(body);
      debugPrint('_multipartData $uri body ${request.fields}');
      request.files
          .add(await http.MultipartFile.fromPath(imageparam, imagepath));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint('response.statusCode is ${response.statusCode}');
        final responseString = await response.stream.bytesToString();
        log("response is=-=-$responseString");
        return builder(responseString);
      } else {
        DialogServiceV1().showSnackBar(
            content: response.reasonPhrase.toString(),
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        debugPrint("response.reasonPhrase=-=- ${response.reasonPhrase} ");
        return null;
      }
    } catch (e) {
      DialogServiceV1().showSnackBar(
          content: e.toString(),
          color: AppColors.red.withOpacity(0.7),
          textclr: AppColors.white);
      throw Exception("Exception is =-=-2 $e");
    }
  }
}
