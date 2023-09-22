import 'dart:typed_data';

import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';

abstract class FileRepository {
  Future<Either<Failure, UploadFileResponse>> uploadFile(
    UploadFileParams uploadFileParams,
  );
  Future<Either<Failure, Uint8List>> selectFile();
}
