import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_params.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/signin/domain/repositories/sign_in_repository.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_response.dart';

class SignInUser implements UseCase<SignInResponse, SignInParams> {
  final SignInRepository repository;

  SignInUser({required this.repository});

  @override
  Future<Either<Failure, SignInResponse>> call(SignInParams params) async {
    return await repository.signInUser(params);
  }
}
