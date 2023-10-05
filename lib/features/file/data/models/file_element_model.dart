import 'dart:convert';

import 'package:carpeta_ciudadana/features/file/domain/entities/file_element.dart';

class FileElementModel extends FileElement {
  FileElementModel({
    required String fieldname,
    required String originalname,
    required String encoding,
    required String mimetype,
    required String newName,
    required int size,
    required String bucket,
    required String key,
    required String acl,
    required String contentType,
    required dynamic contentDisposition,
    required String storageClass,
    required dynamic serverSideEncryption,
    required dynamic metadata,
    required String location,
    required String etag,
  }) : super(
          fieldname: fieldname,
          originalname: originalname,
          encoding: encoding,
          mimetype: mimetype,
          newName: newName,
          size: 0,
          bucket: bucket,
          key: key,
          acl: acl,
          contentType: contentType,
          contentDisposition: contentDisposition,
          storageClass: storageClass,
          serverSideEncryption: serverSideEncryption,
          metadata: metadata,
          location: location,
          etag: etag,
        );

  factory FileElementModel.fromJson(String str) =>
      FileElementModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FileElementModel.fromMap(Map<String, dynamic> json) =>
      FileElementModel(
        fieldname: json["fieldname"],
        originalname: json["originalname"],
        encoding: json["encoding"],
        mimetype: json["mimetype"],
        newName: json["newName"],
        size: json["size"],
        bucket: json["bucket"],
        key: json["key"],
        acl: json["acl"],
        contentType: json["contentType"],
        contentDisposition: json["contentDisposition"],
        storageClass: json["storageClass"],
        serverSideEncryption: json["serverSideEncryption"],
        metadata: json["metadata"],
        location: json["location"],
        etag: json["etag"],
      );

  Map<String, dynamic> toMap() => {
        "fieldname": fieldname,
        "originalname": originalname,
        "encoding": encoding,
        "mimetype": mimetype,
        "newName": newName,
        "size": size,
        "bucket": bucket,
        "key": key,
        "acl": acl,
        "contentType": contentType,
        "contentDisposition": contentDisposition,
        "storageClass": storageClass,
        "serverSideEncryption": serverSideEncryption,
        "metadata": metadata,
        "location": location,
        "etag": etag,
      };
}
