import 'package:equatable/equatable.dart';

class TransferOperatorParams extends Equatable {
  final String userToken;
  final int citizenId;
  final int operatorId;
  final String operatorName;
  final String operatorUrl;
  final String citizenName;
  final String citizenEmail;

  const TransferOperatorParams({
    required this.userToken,
    required this.citizenId,
    required this.operatorId,
    required this.operatorName,
    required this.operatorUrl,
    required this.citizenName,
    required this.citizenEmail,
  });

  @override
  List<Object?> get props => [
        userToken,
        operatorId,
        operatorName,
        operatorUrl,
        citizenId,
        citizenName,
        citizenEmail,
      ];
}
