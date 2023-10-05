import 'dart:typed_data';

import 'package:equatable/equatable.dart';

class SelectFileResponse extends Equatable {
  final String fileName;
  final Uint8List filePickerResult;

  const SelectFileResponse({
    required this.fileName,
    required this.filePickerResult,
  });

  @override
  List<Object?> get props => [fileName, filePickerResult];
}
