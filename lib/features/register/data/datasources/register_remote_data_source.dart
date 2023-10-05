import 'package:dio/dio.dart';

import 'package:carpeta_ciudadana/core/constants/api.dart';
import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';
import 'package:carpeta_ciudadana/features/register/data/models/register_params_model.dart';
import 'package:carpeta_ciudadana/features/register/domain/entities/register_params.dart';

abstract class RegisterRemoteDataSource {
  Future<Response> registerUser({required RegisterParams registerParams});
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final CustomHttpClient client;

  RegisterRemoteDataSourceImpl({required this.client});

  @override
  Future<Response> registerUser(
      {required RegisterParams registerParams}) async {
    print(API.api_register);
    print(registerParams);
    final jsonData = await client.post(
      path: API.api_register,
      body: RegisterParamsModel(
        personId: registerParams.userId,
        name: registerParams.name,
        address: registerParams.address,
        email: registerParams.email,
        password: registerParams.password,
      ).toJson(),
    );
    return jsonData;
  }
}
