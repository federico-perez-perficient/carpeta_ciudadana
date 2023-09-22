import 'dart:convert';

import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_params.dart';

class SignInParamsModel extends SignInParams {
  const SignInParamsModel({required String email, required String password})
      : super(email: email, password: password);

  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }

  String toJson() => jsonEncode(toMap());
}
