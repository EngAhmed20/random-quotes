import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/foundation.dart';
import 'package:quotes_clean/core/api/api_consumer.dart';
import 'package:quotes_clean/core/api/end_point.dart';
import 'package:quotes_clean/core/api/status_code.dart';
import 'package:quotes_clean/core/error/exception.dart';
import 'package:quotes_clean/core/utils/service_locator.dart' as di;

import 'data_interceptors.dart';
class DioConsumer implements ApiConsumer{
  final Dio client;

  DioConsumer({required this.client}){
    (client.httpClientAdapter as  DefaultHttpClientAdapter).onHttpClientCreate=
    (HttpClient client){
      client.badCertificateCallback=
      (X509Certificate cert,String host,int port)=>true;
      return client;
    };
    client.options
    ..baseUrl=endPoint.baseUrl
    ..responseType=ResponseType.plain
    ..followRedirects=false
    ..validateStatus=(status){
      return status !<StatusCode.internalServerError;
    };
    client.interceptors.add(di.getIt<AppIntercepters>());
    if(kDebugMode)
      {
        client.interceptors.add(di.getIt<LogInterceptor>());

      }
  }

  @override
  Future get(String path,{Map<String, dynamic>? queryParameters})async {
    try{
      final response= await client.get(path, queryParameters: queryParameters);
      return _convertResponseIntoJson(response);
    }on DioException catch(error){
      _handleErrorException(error);
    }

  }

  @override
  Future post(String path, {Map<String, dynamic>? body,
    bool formDataIsEnabled = false,
    Map<String, dynamic>? queryParameters})async {
   try{
     final response= await client.post(path, queryParameters: queryParameters,data: body);
     return _convertResponseIntoJson(response);
   } on DioException catch(error){
  _handleErrorException(error);
  }
  }


  @override
  Future put(String path,{Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters}) async{
   try{
     final response= await client.put(path, queryParameters: queryParameters,data: body);
     return _convertResponseIntoJson(response);
   }on DioException catch(error){
     _handleErrorException(error);
   }
  }
dynamic _convertResponseIntoJson(Response<dynamic>response)
{
  final responseJson=jsonDecode(response.data.toString());
  return responseJson;
}
dynamic _handleErrorException(DioException exception){
    switch(exception.type)
        {

      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        throw FetchDataException();
      case DioExceptionType.badCertificate:
        throw BadCertificateCallback;
      case DioExceptionType.badResponse:
        throw BadRequestException();
      case DioExceptionType.cancel:
        throw SocketException.closed();
      case DioExceptionType.unknown:
        throw UnauthorizedException();
    }

}
}