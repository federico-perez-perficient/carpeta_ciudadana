import 'package:equatable/equatable.dart';

class ReadFileParams extends Equatable {
  final int userId;

  const ReadFileParams({
    required this.userId,
  });

  @override
  List<Object?> get props => [userId];
}
