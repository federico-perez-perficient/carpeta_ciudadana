import 'package:equatable/equatable.dart';

class AuthenticateFileParams extends Equatable {
  final String userId;
  final String docKey;
  final String docTitle;

  const AuthenticateFileParams({
    required this.userId,
    required this.docKey,
    required this.docTitle,
  });

  @override
  List<Object?> get props => [userId, docKey, docTitle];
}
