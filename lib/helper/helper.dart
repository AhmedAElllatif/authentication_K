import 'package:dio/dio.dart';

class Helper {

  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://kitchenapi.excprotection.com//en/api/',   //open postman then click on the name of collection(softagi) then click on variables then copy the link in initial variable and paste it here
        receiveDataWhenStatusError: true,
      ),
    );
  }


  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
//    String lang = 'en',
//    String? token,
  }) async
  {
    //write what is in headers her
    dio.options.headers = {         //look at headers in post man
//      'lang':lang,
//      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return await dio.get(
      url,
      queryParameters: query,
    );
  }


  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
//    String lang = 'en',
//    String? token,
  }) async
  {
    //write what is in headers her
    dio.options.headers = {         //look at headers in post man
//      'lang':lang,
//      'Authorization': token??'',
      'Content-Type': 'application/json',
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }

//  static Future<Response> putData({
//    required String url,
//    required Map<String, dynamic> data,
//    Map<String, dynamic>? query,
////    String lang = 'en',
////    String? token,
//  }) async
//  {
//    //write what is in headers her
//    dio.options.headers = {         //look at headers in post man
////      'lang':lang,
////      'Authorization': token??'',
//      'Content-Type': 'application/json',
//    };
//
//    return dio.put(
//      url,
//      queryParameters: query,
//      data: data,
//    );
//  }
}
