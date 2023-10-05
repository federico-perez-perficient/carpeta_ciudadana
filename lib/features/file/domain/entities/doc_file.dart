import 'package:equatable/equatable.dart';

class DocFile extends Equatable {
  final String key;
  final DateTime lastModified;
  final String eTag;
  final int size;
  final String storageClass;
  final String location;

  DocFile({
    required this.key,
    required this.lastModified,
    required this.eTag,
    required this.size,
    required this.storageClass,
    required this.location,
  });
  @override
  List<Object?> get props =>
      [key, lastModified, eTag, size, storageClass, location];
}
