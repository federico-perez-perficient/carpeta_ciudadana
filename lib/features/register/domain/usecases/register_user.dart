import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';
import 'package:carpeta_ciudadana/features/register/domain/entities/register_params.dart';
import 'package:carpeta_ciudadana/features/register/domain/repositories/register_repository.dart';

class RegisterUser implements UseCase<Response, RegisterParams> {
  final RegisterRepository repository;

  RegisterUser({required this.repository});

  @override
  Future<Either<Failure, Response>> call(RegisterParams params) async {
    return await repository.registerUser(params);
  }
}
