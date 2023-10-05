part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object> get props => [];
}

class SignInInitialState extends SignInState {}

class SignInLoadingState extends SignInState {}

class SignOutState extends SignInState {}

class SignedInUserState extends SignInState {
  final int userId;
  final String userName;
  final String userEmail;
  final String token;

  SignedInUserState({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.token,
  });
}

class SignInErrorState extends SignInState {
  final String errorMessage;

  const SignInErrorState({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
