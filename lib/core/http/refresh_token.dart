import 'package:dio/dio.dart';

import 'package:carpeta_ciudadana/core/constants/api.dart';
import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';

abstract class RefreshToken {
  Future<Response> refreshToken(RequestOptions requestOptions);
}

class RefreshTokenImpl implements RefreshToken {
  final CustomHttpClient client;

  RefreshTokenImpl({required this.client});

  @override
  Future<Response> refreshToken(RequestOptions requestOptions) async {
    return await client.post(
      path: API.api_refresh_token,
      parameters: {'email': requestOptions.data['email']},
    );
  }
}
