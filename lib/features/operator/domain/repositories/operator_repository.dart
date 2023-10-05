import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_params.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_response.dart';

abstract class OperatorRepository {
  Future<Either<Failure, TransferOperatorResponse>> transferOperator(
    TransferOperatorParams transferOperatorParams,
  );
}
