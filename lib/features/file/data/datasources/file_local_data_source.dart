import 'dart:typed_data';

import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:file_picker/file_picker.dart';

abstract class FileLocalDataSource {
  Future<Uint8List> readLocalFile();
}

class FileLocalDataSourceImpl extends FileLocalDataSource {
  FileLocalDataSourceImpl();

  @override
  Future<Uint8List> readLocalFile() async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      dialogTitle: 'Select a file to upload',
      allowedExtensions: ['pdf'],
    );
    if (result != null && result.files.isNotEmpty) {
      print('Selected filename: ${result.files.single.name}');
      Uint8List file = result.files.single.bytes!;
      return file;
    } else {
      throw CacheException();
    }
  }
}
