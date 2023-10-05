import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_response.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';

class DeleteFile implements UseCase<DeleteFileResponse, DeleteFileParams> {
  final FileRepository repository;

  const DeleteFile({required this.repository});

  @override
  Future<Either<Failure, DeleteFileResponse>> call(
      DeleteFileParams params) async {
    return await repository.deleteFile(params);
  }
}
