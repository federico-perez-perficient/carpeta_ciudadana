import 'package:equatable/equatable.dart';

class DeleteFileResponse extends Equatable {
  final String message;

  DeleteFileResponse({required this.message});

  @override
  List<Object?> get props => [message];
}
