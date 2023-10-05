import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class UploadFileParams extends Equatable {
  final int userId;
  final String name;
  final Uint8List filePickerResult;

  const UploadFileParams({
    required this.userId,
    required this.name,
    required this.filePickerResult,
  });

  @override
  List<Object?> get props => [filePickerResult];
}
