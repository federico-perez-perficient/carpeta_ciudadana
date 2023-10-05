import 'package:carpeta_ciudadana/core/constants/api.dart';
import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:carpeta_ciudadana/features/operator/data/models/transfer_operator_params_model.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_params.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_response.dart';
import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';

abstract class OperatorRemoteDataSource {
  Future<TransferOperatorResponse> transferOperator(
      {required TransferOperatorParams transferOperatorParams});
}

class OperatorRemoteDataSourceImpl extends OperatorRemoteDataSource {
  final CustomHttpClient client;

  OperatorRemoteDataSourceImpl({required this.client});

  @override
  Future<TransferOperatorResponse> transferOperator(
      {required TransferOperatorParams transferOperatorParams}) async {
    try {
      final response = await client.post(
        path: API.transfer_operator,
        body: TransferOperatorParamsModel(
          userToken: transferOperatorParams.userToken,
          operatorId: transferOperatorParams.operatorId,
          operatorUrl: transferOperatorParams.operatorUrl,
          citizenId: transferOperatorParams.citizenId,
          citizenName: transferOperatorParams.citizenName,
          citizenEmail: transferOperatorParams.citizenEmail,
          operatorName: transferOperatorParams.operatorName,
        ).toJson(),
      );
      if (response.statusCode == 200) {
        return TransferOperatorResponse(response: response);
      } else {
        throw ServerException(
          message: '',
          errorCode: response.statusCode ?? 400,
        );
      }
    } catch (e) {
      throw ServerException(message: '', errorCode: 400);
    }
  }
}
