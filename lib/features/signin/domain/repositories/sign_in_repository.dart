import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_out_response.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_params.dart';
import 'package:carpeta_ciudadana/features/signin/domain/entities/sign_in_response.dart';

abstract class SignInRepository {
  Future<Either<Failure, SignInResponse>> signInUser(SignInParams signInParams);
  // Future<Either<Failure, SignOutResponse>> signOutUser();
}
