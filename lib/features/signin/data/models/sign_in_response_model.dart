import 'dart:convert';

import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_response.dart';

class SignInResponseModel extends SignInResponse {
  SignInResponseModel({
    required bool error,
    required String message,
    required Data data,
  }) : super(
          error: error,
          message: message,
          data: data,
        );

  factory SignInResponseModel.fromJson(String str) =>
      SignInResponseModel.fromMap(json.decode(str));

  factory SignInResponseModel.fromMap(Map<String, dynamic> json) =>
      SignInResponseModel(
        error: json["error"],
        message: json["message"],
        data: DataModel.fromMap(json["data"]),
      );
}

class DataModel extends Data {
  DataModel({
    required DateTime expiry,
    required String idCard,
    required String name,
    required String token,
  }) : super(
          expiry: expiry,
          idCard: idCard,
          name: name,
          token: token,
        );

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
        expiry: DateTime.parse(json["Expiry"]),
        idCard: json["IDCard"],
        name: json["Name"],
        token: json["Token"],
      );

  Map<String, dynamic> toMap() => {
        "Expiry": expiry.toIso8601String(),
        "IDCard": idCard,
        "Name": name,
        "Token": token,
      };
}
