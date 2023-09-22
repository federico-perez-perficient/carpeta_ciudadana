import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';

class UploadFile implements UseCase<UploadFileResponse, UploadFileParams> {
  final FileRepository repository;

  const UploadFile({required this.repository});

  @override
  Future<Either<Failure, UploadFileResponse>> call(
      UploadFileParams params) async {
    return await repository.uploadFile(params);
  }
}
