import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/data/models/data_model.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/data.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_response.dart';

class ReadFileResponseModel extends ReadFileResponse {
  ReadFileResponseModel({
    required Data data,
  }) : super(data: data);

  factory ReadFileResponseModel.fromRawJson(String str) =>
      ReadFileResponseModel.fromJson(json.decode(str));

  factory ReadFileResponseModel.fromJson(Map<String, dynamic> json) =>
      ReadFileResponseModel(
        data: DataModel.fromMap(json["data"]),
      );
}
