import 'package:carpeta_ciudadana/features/file/domain/entities/file_element.dart';
import 'package:equatable/equatable.dart';

class UploadFileResponse extends Equatable {
  final String msg;
  final FileElement fileElement;

  const UploadFileResponse({
    required this.msg,
    required this.fileElement,
  });

  @override
  List<Object?> get props => [msg, fileElement];
}
