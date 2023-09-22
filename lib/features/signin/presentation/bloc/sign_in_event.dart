part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class SignInUserEvent extends SignInEvent {
  final String email;
  final String password;

  const SignInUserEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class SignInTestEventLoaded extends SignInEvent {}
