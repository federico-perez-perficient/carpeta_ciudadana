import 'package:equatable/equatable.dart';

class SignInTokenPayload extends Equatable {
  final String name;
  final String lastName;
  final String email;
  final String photo;
  final String userGuid;
  final int exp;

  SignInTokenPayload({
    required this.name,
    required this.lastName,
    required this.email,
    required this.photo,
    required this.userGuid,
    required this.exp,
  });

  @override
  List<Object?> get props => [
        name,
        lastName,
        email,
        userGuid,
        exp,
      ];
}
