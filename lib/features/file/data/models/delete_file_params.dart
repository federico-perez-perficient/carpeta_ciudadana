import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_params.dart';

class DeleteFileParamsModel extends DeleteFileParams {
  DeleteFileParamsModel({
    required String fileKeys,
  }) : super(fileKeys: fileKeys);

  factory DeleteFileParamsModel.fromJson(String str) =>
      DeleteFileParamsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeleteFileParamsModel.fromMap(Map<String, dynamic> json) =>
      DeleteFileParamsModel(
        fileKeys: List<String>.from(json["fileKeys"].map((x) => x)).first,
      );

  Map<String, dynamic> toMap() => {
        "fileKeys": [fileKeys],
      };
}
