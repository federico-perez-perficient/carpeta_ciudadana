import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_response.dart';

class DeleteFileResponseModel extends DeleteFileResponse {
  DeleteFileResponseModel({
    required String msg,
  }) : super(message: msg);

  factory DeleteFileResponseModel.fromJson(String str) =>
      DeleteFileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteFileResponseModel.fromMap(Map<String, dynamic> json) =>
      DeleteFileResponseModel(
        msg: json["msg"],
      );

  Map<String, dynamic> toMap() => {
        "msg": message,
      };
}
