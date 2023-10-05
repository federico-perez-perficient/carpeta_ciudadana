import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/domain/entities/doc_file.dart';

class DocFileModel extends DocFile {
  DocFileModel({
    required String key,
    required DateTime lastModified,
    required String eTag,
    required int size,
    required String storageClass,
    required String location,
  }) : super(
          key: key,
          lastModified: lastModified,
          eTag: eTag,
          size: size,
          storageClass: storageClass,
          location: location,
        );

  factory DocFileModel.fromJson(String str) =>
      DocFileModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DocFileModel.fromMap(Map<String, dynamic> json) => DocFileModel(
        key: json["Key"],
        lastModified: DateTime.parse(json["LastModified"]),
        eTag: json["ETag"],
        size: json["Size"],
        storageClass: json["StorageClass"],
        location: json["location"],
      );

  Map<String, dynamic> toMap() => {
        "Key": key,
        "LastModified": lastModified.toIso8601String(),
        "ETag": eTag,
        "Size": size,
        "StorageClass": storageClass,
        "location": location,
      };
}
