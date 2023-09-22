import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/register/domain/entities/register_params.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Response>> registerUser(RegisterParams registerParams);
}
