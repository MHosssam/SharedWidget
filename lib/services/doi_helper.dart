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



///TODO:
/*

*Ex get method :

void getHomeData()
  {

    DioHelperService.to.getData(
      url: HOME,
      token: token,
    ).then((value)
    {
      homeModel = HomeModel.fromJson(value.data);

      printFullText(homeModel.data.banners[0].image);
      print(homeModel.status);

    }).catchError((error)
    {
      print(error.toString());
    });
  }
}

*Ex post method :

void userLogin({
    @required String email,
    @required String password,
  })
  {

    DioHelperService.to.postData(
      url: LOGIN,
      data:
      {
        'email': email,
        'password': password,
      },
    ).then((value)
    {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
    }).catchError((error)
    {
      print(error.toString());
    });
  }

  *Ex model :

  class ShopLoginModel
{
  bool status;
  String message;
  UserData data;

  ShopLoginModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}

class UserData
{
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  // named constructor
  UserData.fromJson(Map<String, dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }
}

 */