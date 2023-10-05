import 'package:dio/dio.dart';

import 'package:carpeta_ciudadana/core/http/dio_client_mix.dart';
import 'package:carpeta_ciudadana/core/http/http_retry.dart';

class InterceptorManager {
  final DioClientMix dioClientMix;
  final HttpRetry httpRetry;

  InterceptorManager({
    required this.httpRetry,
    required this.dioClientMix,
  }) {
    dioClientMix.interceptors.addAll(listInterceptors());
  }

  List<Interceptor> listInterceptors() {
    return [
      LogInterceptor(),
      // AuthInterceptor(
      //   secureStorage: secureStorage,
      //   httpRetry: httpRetry,
      //   refreshToken: refreshToken,
      // ),
    ];
  }
}
