import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';

class SelectFile implements UseCase<Uint8List, NoParams> {
  final FileRepository repository;

  const SelectFile({required this.repository});

  @override
  Future<Either<Failure, Uint8List>> call(NoParams params) async {
    return await repository.selectFile();
  }
}
