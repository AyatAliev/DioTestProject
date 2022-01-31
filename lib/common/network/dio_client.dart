import 'dart:convert';
import 'package:dio/dio.dart';
import 'logging_interceptor.dart';

class DioClient {

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://new2.mobil2b.com/api/',
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ),
  )
    ..interceptors.add(LoggingInterceptor())
    ..options.headers.addAll(<String, String>{'Authorization': 'Basic ${base64Encode(utf8.encode("new:new321!"))}'});

  Dio get dio => _dio;



}
