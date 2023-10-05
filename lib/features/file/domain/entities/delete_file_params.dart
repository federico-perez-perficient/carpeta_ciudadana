import 'package:equatable/equatable.dart';

class DeleteFileParams extends Equatable {
  final String fileKeys;

  const DeleteFileParams({
    required this.fileKeys,
  });

  @override
  List<Object?> get props => [fileKeys];
}
