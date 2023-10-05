import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/data/models/doc_file_model.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/data.dart';

class DataModel extends Data {
  DataModel({
    required List<DocFileModel> contents,
    required bool isTruncated,
    required String name,
    required String prefix,
    required int maxKeys,
    required List<dynamic> commonPrefixes,
    required int keyCount,
  }) : super(
          contents: contents,
          isTruncated: isTruncated,
          name: name,
          prefix: prefix,
          maxKeys: maxKeys,
          commonPrefixes: commonPrefixes,
          keyCount: keyCount,
        );

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
        isTruncated: json["IsTruncated"],
        contents: List<DocFileModel>.from(
            // ignore: unnecessary_lambdas
            json["Contents"].map((x) => DocFileModel.fromMap(x))),
        name: json["Name"],
        prefix: json["Prefix"],
        maxKeys: json["MaxKeys"],
        commonPrefixes:
            List<dynamic>.from(json["CommonPrefixes"].map((x) => x)),
        keyCount: json["KeyCount"],
      );
}
