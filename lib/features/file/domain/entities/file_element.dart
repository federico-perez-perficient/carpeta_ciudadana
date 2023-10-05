import 'package:equatable/equatable.dart';

class FileElement extends Equatable {
  final String fieldname;
  final String originalname;
  final String encoding;
  final String mimetype;
  final String newName;
  final int size;
  final String bucket;
  final String key;
  final String acl;
  final String contentType;
  final dynamic contentDisposition;
  final String storageClass;
  final dynamic serverSideEncryption;
  final dynamic metadata;
  final String location;
  final String etag;

  FileElement({
    required this.fieldname,
    required this.originalname,
    required this.encoding,
    required this.mimetype,
    required this.newName,
    required this.size,
    required this.bucket,
    required this.key,
    required this.acl,
    required this.contentType,
    required this.contentDisposition,
    required this.storageClass,
    required this.serverSideEncryption,
    required this.metadata,
    required this.location,
    required this.etag,
  });

  @override
  List<Object?> get props => [
        fieldname,
        originalname,
        encoding,
        mimetype,
        newName,
        size,
        bucket,
        key,
        acl,
        contentType,
        contentDisposition,
        storageClass,
        serverSideEncryption,
        metadata,
        location,
        etag,
      ];
}
