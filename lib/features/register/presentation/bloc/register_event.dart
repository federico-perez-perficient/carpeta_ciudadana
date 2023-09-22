part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserEvent extends RegisterEvent {
  final String personId;
  final String name;
  final String address;
  final String email;
  final String password;

  const RegisterUserEvent({
    required this.personId,
    required this.name,
    required this.address,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, address, email, password];
}
