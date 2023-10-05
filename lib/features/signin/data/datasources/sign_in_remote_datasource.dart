import 'package:carpeta_ciudadana/core/constants/api.dart';
import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';
import 'package:carpeta_ciudadana/features/signin/data/models/sign_in_params_model.dart';
import 'package:carpeta_ciudadana/features/signin/data/models/sign_in_response_model.dart';
import 'package:carpeta_ciudadana/features/signin/data/models/sign_out_params_model.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_params.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_out_params.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_out_response.dart';

abstract class SignInRemoteDataSource {
  Future<SignInResponseModel> signInUser({required SignInParams signInParams});
  Future<SignOutResponse> signOutUser({required SignOutParams signOutParams});
}

class SignInRemoteDataSourceImpl extends SignInRemoteDataSource {
  final CustomHttpClient client;

  SignInRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<SignInResponseModel> signInUser(
      {required SignInParams signInParams}) async {
    final jsonData = await client.post(
      path: API.api_login,
      body: SignInParamsModel(
        email: signInParams.email,
        password: signInParams.password,
      ).toJson(),
    );
    return SignInResponseModel.fromMap(jsonData.data);
  }

  @override
  Future<SignOutResponse> signOutUser(
      {required SignOutParams signOutParams}) async {
    final response = await client.post(
      path: API.api_logout,
      body: SignOutParamsModel(userToken: signOutParams.usertoken).toJson(),
    );
    return SignOutResponse(response: response);
  }
}
