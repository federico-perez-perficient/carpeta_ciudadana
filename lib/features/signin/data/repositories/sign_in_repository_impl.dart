import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_out_response.dart';
import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/signin/data/datasources/sign_in_remote_datasource.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_params.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_response.dart';
import 'package:carpeta_ciudadana/features/signin/domain/repositories/sign_in_repository.dart';

class SignInRepositoryImplementation extends SignInRepository {
  final SignInRemoteDataSource signinRemoteDataSource;

  SignInRepositoryImplementation({
    required this.signinRemoteDataSource,
  });

  @override
  Future<Either<Failure, SignInResponse>> signInUser(
      SignInParams signInParams) async {
    try {
      final signInResponseModel = await signinRemoteDataSource.loginUser(
        signInParams: signInParams,
      );

      return Right(signInResponseModel);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }
}
