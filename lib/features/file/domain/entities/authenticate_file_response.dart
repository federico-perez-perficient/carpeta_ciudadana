import 'package:equatable/equatable.dart';

class AuthenticateFileResponse extends Equatable {
  final String response;
  final int status;

  const AuthenticateFileResponse({
    required this.response,
    required this.status,
  });

  @override
  List<Object?> get props => [response, status];
}
