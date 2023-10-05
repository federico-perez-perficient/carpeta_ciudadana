import 'package:file_picker/file_picker.dart';

import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/select_file_response.dart';

abstract class FileLocalDataSource {
  Future<SelectFileResponse> readLocalFile();
}

class FileLocalDataSourceImpl extends FileLocalDataSource {
  FileLocalDataSourceImpl();

  @override
  Future<SelectFileResponse> readLocalFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      dialogTitle: 'Select a file to upload',
      allowedExtensions: ['pdf', 'jpeg'],
    );
    if (result != null && result.files.isNotEmpty) {
      return SelectFileResponse(
        fileName: result.files.single.name,
        filePickerResult: result.files.single.bytes!,
      );
    } else {
      throw CacheException();
    }
  }
}
