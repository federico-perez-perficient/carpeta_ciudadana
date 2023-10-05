import 'package:equatable/equatable.dart';

class SignOutParams extends Equatable {
  final String usertoken;

  const SignOutParams({required this.usertoken});

  @override
  List<Object> get props => [usertoken];
}
