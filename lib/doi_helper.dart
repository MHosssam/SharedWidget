import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;

///TODO:
/*
 * dio: ^4.0.0 
 */

class DioHelperService extends GetxService {
  static DioHelperService get to => Get.find();

  Dio? dio;

  init() {
    dio = Dio(
      BaseOptions(
        ///TODO: Base Url.
        baseUrl: 'https://student.valuxapps.com/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await dio!.get(
      url,
      queryParameters: query ?? null,
    );
  }

  Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String lang = 'en',
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return dio!.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}

///TODO:
/*

*Ex get method :

void getHomeData()
  {

    DioHelper.getData(
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

    DioHelper.postData(
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