import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_response.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';

class ReadFile implements UseCase<ReadFileResponse, ReadFileParams> {
  final FileRepository repository;

  const ReadFile({required this.repository});

  @override
  Future<Either<Failure, ReadFileResponse>> call(ReadFileParams params) async {
    return await repository.readFile(params);
  }
}
