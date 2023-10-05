import 'dart:convert';

import 'package:carpeta_ciudadana/features/register/domain/entities/register_params.dart';

class RegisterParamsModel extends RegisterParams {
  const RegisterParamsModel({
    required int personId,
    required String name,
    required String address,
    required String email,
    required String password,
  }) : super(
          userId: personId,
          name: name,
          address: address,
          email: email,
          password: password,
        );

  Map<String, dynamic> toMap() {
    return {
      "idcard": userId,
      "name": name,
      "address": address,
      "email": email,
      "password": password,
    };
  }

  String toJson() => jsonEncode(toMap());
}
