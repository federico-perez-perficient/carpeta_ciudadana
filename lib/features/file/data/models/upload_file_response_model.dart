import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/data/models/file_element_model.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';

class UploadFileResponseModel extends UploadFileResponse {
  UploadFileResponseModel({
    required String msg,
    required FileElementModel fileElement,
  }) : super(
          msg: msg,
          fileElement: fileElement,
        );

  factory UploadFileResponseModel.fromJson(String str) =>
      UploadFileResponseModel.fromMap(json.decode(str));

  factory UploadFileResponseModel.fromMap(Map<String, dynamic> json) {
    final fileElementModel = List<FileElementModel>.from(
        // ignore: unnecessary_lambdas
        json["files"].map((x) => FileElementModel.fromMap(x)));
    print(fileElementModel);
    return UploadFileResponseModel(
      msg: json["msg"],
      fileElement: fileElementModel[0],
    );
  }
}
