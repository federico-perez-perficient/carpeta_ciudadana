import 'dart:convert';
import 'dart:typed_data';

import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';

class UploadFileParamsModel extends UploadFileParams {
  const UploadFileParamsModel({
    required Uint8List filePickerResult,
  }) : super(filePickerResult: filePickerResult);

  factory UploadFileParamsModel.fromJson(String str) =>
      UploadFileParamsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadFileParamsModel.fromMap(Map<String, dynamic> json) =>
      UploadFileParamsModel(
        filePickerResult: json["file"],
      );

  Map<String, dynamic> toMap() => {
        "file": filePickerResult,
      };
}
