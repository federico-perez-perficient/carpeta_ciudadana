import 'dart:convert';
import 'dart:typed_data';

import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';

class UploadFileParamsModel extends UploadFileParams {
  const UploadFileParamsModel({
    required int userId,
    required String name,
    required Uint8List filePickerResult,
  }) : super(
          userId: userId,
          name: name,
          filePickerResult: filePickerResult,
        );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "file": filePickerResult,
      };
}
