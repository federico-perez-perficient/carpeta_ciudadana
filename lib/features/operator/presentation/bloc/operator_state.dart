part of 'operator_bloc.dart';

abstract class OperatorState extends Equatable {
  final List<GovOperator>? listOperators;
  final GovOperator? govOperator;

  OperatorState({
    required this.listOperators,
    required this.govOperator,
  });

  @override
  List<Object> get props => [];
}

class OperatorInitialState extends OperatorState {
  OperatorInitialState({
    final List<GovOperator>? listOperators,
    final GovOperator? govOperator,
  }) : super(
          listOperators: listOperators,
          govOperator: govOperator,
        );
}

class OperatorLoadingState extends OperatorState {
  OperatorLoadingState({
    final List<GovOperator>? listOperators,
    final GovOperator? govOperator,
  }) : super(
          listOperators: listOperators,
          govOperator: govOperator,
        );
}

class OperatorChangedState extends OperatorState {
  OperatorChangedState({
    final List<GovOperator>? listOperators,
    final GovOperator? govOperator,
  }) : super(
          listOperators: listOperators,
          govOperator: govOperator,
        );
}

class OperatorErrorState extends OperatorState {
  final String errorMessage;

  OperatorErrorState({
    required this.errorMessage,
    final List<GovOperator>? listOperators,
    final GovOperator? govOperator,
  }) : super(
          listOperators: listOperators,
          govOperator: govOperator,
        );

  @override
  List<Object> get props => [errorMessage];
}
