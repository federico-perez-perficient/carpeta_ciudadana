part of 'operator_bloc.dart';

abstract class OperatorEvent extends Equatable {
  const OperatorEvent();

  @override
  List<Object> get props => [];
}

class OperatorTransferEvent extends OperatorEvent {
  final TransferOperatorParams transferOperatorParams;

  OperatorTransferEvent({required this.transferOperatorParams});
}
