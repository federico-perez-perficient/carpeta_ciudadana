import 'dart:convert';

import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_params.dart';

class TransferOperatorParamsModel extends TransferOperatorParams {
  TransferOperatorParamsModel({
    required String userToken,
    required int citizenId,
    required int operatorId,
    required String operatorUrl,
    required String operatorName,
    required String citizenName,
    required String citizenEmail,
  }) : super(
          userToken: userToken,
          citizenId: citizenId,
          operatorId: operatorId,
          operatorUrl: operatorUrl,
          operatorName: operatorName,
          citizenName: citizenName,
          citizenEmail: citizenEmail,
        );

  factory TransferOperatorParamsModel.fromJson(String str) =>
      TransferOperatorParamsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TransferOperatorParamsModel.fromMap(Map<String, dynamic> json) =>
      TransferOperatorParamsModel(
        userToken: json["userToken"],
        citizenId: json["id"],
        operatorId: json["operatorId"],
        operatorUrl: json["operatorUrl"],
        operatorName: json["operatorName"],
        citizenName: json["citizenName"],
        citizenEmail: json["citizenEmail"],
      );

  Map<String, dynamic> toMap() => {
        "userToken": userToken,
        "id": citizenId,
        "operatorId": operatorId,
        "operatorUrl": operatorUrl,
        "operatorName": operatorName,
        "citizenName": citizenName,
        "citizenEmail": citizenEmail,
      };
}
