import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/select_file_response.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';

class SelectFile implements UseCase<SelectFileResponse, NoParams> {
  final FileRepository repository;

  const SelectFile({required this.repository});

  @override
  Future<Either<Failure, SelectFileResponse>> call(NoParams params) async {
    return await repository.selectFile();
  }
}
