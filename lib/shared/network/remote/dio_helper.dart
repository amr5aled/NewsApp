import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper{

 static Dio dio;
  static int()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );

  }
  //get data//
  static Future<Response> getdata({@ required String url,@ required Map<String, dynamic> query})async //response //http respons info//
{
    print('sadfsd');
  return await dio.get(url,queryParameters: query,);


}
}