import 'package:equatable/equatable.dart';

class GovOperator extends Equatable {
  final String name;
  final int operatorId;
  final String operatorUrl;

  const GovOperator({
    required this.name,
    required this.operatorId,
    required this.operatorUrl,
  });

  @override
  List<Object?> get props => [name, operatorId, operatorUrl];
}
