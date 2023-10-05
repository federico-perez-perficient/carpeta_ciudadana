import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_params.dart';

class AuthenticateFileParamsModel extends AuthenticateFileParams {
  AuthenticateFileParamsModel({
    required String idCitizen,
    required String keyId,
    required String documentTitle,
  }) : super(
          userId: idCitizen,
          docKey: keyId,
          docTitle: documentTitle,
        );

  factory AuthenticateFileParamsModel.fromJson(String str) =>
      AuthenticateFileParamsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthenticateFileParamsModel.fromMap(Map<String, dynamic> json) =>
      AuthenticateFileParamsModel(
        idCitizen: json["idCitizen"],
        keyId: json["keyID"],
        documentTitle: json["documentTitle"],
      );

  Map<String, dynamic> toMap() => {
        "idCitizen": userId,
        "keyID": docKey,
        "documentTitle": docTitle,
      };
}
