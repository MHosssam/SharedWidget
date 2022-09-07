import 'dart:io';

import 'package:dio/dio.dart';

/*
 * dio: ^4.0.0 
 */

const String authHeader = 'Authorization';
const String baseUrl = 'baseUrl';
const String appLocaleCode = 'en';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 5000,
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = appLocaleCode,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      authHeader: token ?? '',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? bodyData,
    String lang = appLocaleCode,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      authHeader: token ?? '',
    };

    ///TODO : to upload image
    // String fileName = file.path.split('/').last;
    // FormData formData = FormData.fromMap({
    //   "file": await MultipartFile.fromFile(file.path, filename: fileName),
    // });

    return dio.post(
      url,
      data: bodyData,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = appLocaleCode,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      authHeader: token ?? '',
    };
    return dio.put(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = appLocaleCode,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      authHeader: token ?? '',
    };
    return dio.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> downloadFile({
    required String urlPath,
    required String savePath,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String lang = appLocaleCode,
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      authHeader: token ?? '',
    };
    return dio.download(
      urlPath,
      savePath,
      data: data,
      queryParameters: query,
    );
  }
}
