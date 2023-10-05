part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInitialEvent extends SignInEvent {}

class SignInUserEvent extends SignInEvent {
  final String email;
  final String password;

  const SignInUserEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignOutUserEvent extends SignInEvent {
  final String token;

  const SignOutUserEvent({required this.token});

  @override
  List<Object> get props => [token];
}
