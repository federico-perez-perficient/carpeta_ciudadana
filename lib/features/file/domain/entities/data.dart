import 'package:equatable/equatable.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/doc_file.dart';

class Data extends Equatable {
  final List<DocFile> contents;
  final bool isTruncated;
  final String name;
  final String prefix;
  final int maxKeys;
  final List<dynamic> commonPrefixes;
  final int keyCount;

  Data({
    required this.isTruncated,
    required this.contents,
    required this.name,
    required this.prefix,
    required this.maxKeys,
    required this.commonPrefixes,
    required this.keyCount,
  });

  @override
  List<Object?> get props => [];
}
