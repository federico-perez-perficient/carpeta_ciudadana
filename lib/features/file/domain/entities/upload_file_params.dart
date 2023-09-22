import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class UploadFileParams extends Equatable {
  final Uint8List filePickerResult;

  const UploadFileParams({
    required this.filePickerResult,
  });

  @override
  List<Object?> get props => [filePickerResult];
}
