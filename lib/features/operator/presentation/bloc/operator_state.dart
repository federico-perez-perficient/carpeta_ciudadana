part of 'operator_bloc.dart';

abstract class OperatorState extends Equatable {
  const OperatorState();  

  @override
  List<Object> get props => [];
}
class OperatorInitial extends OperatorState {}
