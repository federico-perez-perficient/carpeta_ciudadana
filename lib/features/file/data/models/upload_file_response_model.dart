import 'dart:convert';
import 'dart:typed_data';

import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';

class UploadFileResponseModel extends UploadFileResponse {
  const UploadFileResponseModel({
    required Uint8List filePickerResult,
  }) : super();

  factory UploadFileResponseModel.fromJson(String str) =>
      UploadFileResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UploadFileResponseModel.fromMap(Map<String, dynamic> json) =>
      UploadFileResponseModel(
        filePickerResult: json["file"],
      );

  Map<String, dynamic> toMap() => {
        // "file": filePickerResult,
      };
}
