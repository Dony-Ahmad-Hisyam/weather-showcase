import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather/core/network/interceptors/auth_interceptor.dart';
import 'package:weather/core/network/interceptors/logger_interceptor.dart';

class DioClient {
  DioClient._();

  static final DioClient _instance = DioClient._();

  factory DioClient() => _instance;

  late final Dio dio = _createDio();

  Dio _createDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    if (kDebugMode) {
      dio.interceptors.addAll([AuthInterceptor(), buildLogger()]);
    }

    return dio;
  }
}
