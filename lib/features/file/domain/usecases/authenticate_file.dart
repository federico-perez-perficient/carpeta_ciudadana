import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_response.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';

class AuthenticateFile
    implements UseCase<AuthenticateFileResponse, AuthenticateFileParams> {
  final FileRepository repository;

  const AuthenticateFile({required this.repository});

  @override
  Future<Either<Failure, AuthenticateFileResponse>> call(
      AuthenticateFileParams params) async {
    return await repository.authenticateFile(params);
  }
}
