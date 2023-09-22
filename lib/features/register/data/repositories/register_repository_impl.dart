import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/register/data/datasources/register_remote_data_source.dart';
import 'package:carpeta_ciudadana/features/register/domain/entities/register_params.dart';
import 'package:carpeta_ciudadana/features/register/domain/repositories/register_repository.dart';

class RegisterRepositoryImplementation extends RegisterRepository {
  final RegisterRemoteDataSource registerRemoteDataSource;

  RegisterRepositoryImplementation({
    required this.registerRemoteDataSource,
  });

  @override
  Future<Either<Failure, Response>> registerUser(
      RegisterParams registerParams) async {
    try {
      final registerResponse = await registerRemoteDataSource.registerUser(
        registerParams: registerParams,
      );

      return Right(registerResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
