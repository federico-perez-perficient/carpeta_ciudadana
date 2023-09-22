import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class SignOutResponse extends Equatable {
  final Response response;

  const SignOutResponse({required this.response});

  @override
  List<Object?> get props => [response];
}
