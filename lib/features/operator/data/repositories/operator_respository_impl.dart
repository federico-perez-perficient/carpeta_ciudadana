import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/operator/data/datasources/operator_remote_data_source.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_params.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_response.dart';
import 'package:carpeta_ciudadana/features/operator/domain/repositories/operator_repository.dart';

class OperatorRepositoryImpl extends OperatorRepository {
  final OperatorRemoteDataSource operatorRemoteDataSource;

  OperatorRepositoryImpl({required this.operatorRemoteDataSource});

  @override
  Future<Either<Failure, TransferOperatorResponse>> transferOperator(
    TransferOperatorParams transferOperatorParams,
  ) async {
    try {
      final transferResponse = await operatorRemoteDataSource.transferOperator(
        transferOperatorParams: transferOperatorParams,
      );
      return Right(transferResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error'));
    }
  }
}
