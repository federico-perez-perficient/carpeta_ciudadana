import 'package:equatable/equatable.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/data.dart';

class ReadFileResponse extends Equatable {
  final Data data;

  const ReadFileResponse({
    required this.data,
  });

  @override
  List<Object?> get props => [data];
}
