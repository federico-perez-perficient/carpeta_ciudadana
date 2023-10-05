import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:carpeta_ciudadana/core/constants/constants.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/gov_operator.dart';
import 'package:carpeta_ciudadana/features/operator/domain/entities/transfer_operator_params.dart';
import 'package:carpeta_ciudadana/features/operator/domain/usecases/transfer_operator.dart';

part 'operator_event.dart';
part 'operator_state.dart';

class OperatorBloc extends Bloc<OperatorEvent, OperatorState> {
  final TransferOperator transferOperator;

  OperatorBloc({
    required this.transferOperator,
  }) : super(OperatorInitialState()) {
    on<OperatorTransferEvent>((event, emit) async {
      emit(OperatorLoadingState());
      final failureOrOperatorChanged =
          await transferOperator(TransferOperatorParams(
        operatorId: event.transferOperatorParams.operatorId,
        operatorUrl: event.transferOperatorParams.operatorUrl,
        operatorName: event.transferOperatorParams.operatorName,
        citizenId: event.transferOperatorParams.citizenId,
        citizenName: event.transferOperatorParams.citizenName,
        citizenEmail: event.transferOperatorParams.citizenEmail,
        userToken: event.transferOperatorParams.userToken,
      ));
      failureOrOperatorChanged.fold((failure) {
        emit(OperatorErrorState(
          errorMessage: Constants.serverFailureMessage,
        ));
        emit(OperatorInitialState());
      }, (changed) {
        emit(OperatorChangedState());
        emit(OperatorInitialState());
      });
    });
  }
}
