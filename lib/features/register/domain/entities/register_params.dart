import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  final int userId;
  final String name;
  final String address;
  final String email;
  final String password;

  const RegisterParams({
    required this.userId,
    required this.name,
    required this.address,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, address, email, password, userId];
}
