import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_params.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_response.dart';
import 'package:carpeta_ciudadana/features/operator/domain/repositories/operator_repository.dart';
import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/core/usecase/usecase.dart';

class TransferOperator
    implements UseCase<TransferOperatorResponse, TransferOperatorParams> {
  final OperatorRepository repository;

  TransferOperator({required this.repository});

  @override
  Future<Either<Failure, TransferOperatorResponse>> call(
      TransferOperatorParams params) async {
    return await repository.transferOperator(params);
  }
}
