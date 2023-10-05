import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_out_params.dart';
import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_out_response.dart';
import 'package:carpeta_ciudadana/features/signin/domain/repositories/sign_in_repository.dart';

class SignOutUser implements UseCase<SignOutResponse, SignOutParams> {
  final SignInRepository repository;

  SignOutUser({required this.repository});

  @override
  Future<Either<Failure, SignOutResponse>> call(SignOutParams params) async {
    return await repository.signOutUser(params);
  }
}
