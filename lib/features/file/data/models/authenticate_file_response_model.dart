import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_response.dart';

class AuthenticateFileResponseModel extends AuthenticateFileResponse {
  AuthenticateFileResponseModel({
    required String response,
    required int status,
  }) : super(
          response: response,
          status: status,
        );

  factory AuthenticateFileResponseModel.fromJson(String str) =>
      AuthenticateFileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthenticateFileResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthenticateFileResponseModel(
        response: json["response"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "response": response,
        "status": status,
      };
}
