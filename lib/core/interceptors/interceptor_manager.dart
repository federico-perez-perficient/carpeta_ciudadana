import 'package:dio/dio.dart';

import 'package:carpeta_ciudadana/core/http/dio_client_mix.dart';
import 'package:carpeta_ciudadana/core/http/http_retry.dart';
import 'package:carpeta_ciudadana/core/http/refresh_token.dart';

import 'package:carpeta_ciudadana/core/interceptors/auth_interceptor.dart';

class InterceptorManager {
  final DioClientMix dioClientMix;
  // final SecureStorage secureStorage;
  final HttpRetry httpRetry;
  final RefreshToken refreshToken;

  InterceptorManager({
    // required this.secureStorage,
    required this.httpRetry,
    required this.refreshToken,
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
