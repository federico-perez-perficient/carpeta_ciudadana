import 'dart:convert';

import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_out_params.dart';

class SignOutParamsModel extends SignOutParams {
  const SignOutParamsModel({required String userToken})
      : super(usertoken: userToken);

  Map<String, dynamic> toMap() {
    return {"token": usertoken};
  }

  String toJson() => jsonEncode(toMap());
}
