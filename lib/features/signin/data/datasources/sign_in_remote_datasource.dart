import 'package:carpeta_ciudadana/core/constants/api.dart';
import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';
import 'package:carpeta_ciudadana/features/signin/data/models/sign_in_params_model.dart';
import 'package:carpeta_ciudadana/features/signin/data/models/sign_in_response_model.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_params.dart';

abstract class SignInRemoteDataSource {
  Future<SignInResponseModel> loginUser({required SignInParams signInParams});
}

class SignInRemoteDataSourceImpl extends SignInRemoteDataSource {
  final CustomHttpClient client;

  SignInRemoteDataSourceImpl({required this.client});

  @override
  Future<SignInResponseModel> loginUser(
      {required SignInParams signInParams}) async {
    final jsonData = await client.post(
      path: API.api_auth,
      body: SignInParamsModel(
        email: signInParams.email,
        password: signInParams.password,
      ).toJson(),
    );
    return SignInResponseModel.fromMap(jsonData.data);
  }
}
