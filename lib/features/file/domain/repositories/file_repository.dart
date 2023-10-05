import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_response.dart';
import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/select_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';

abstract class FileRepository {
  Future<Either<Failure, UploadFileResponse>> uploadFile(
    UploadFileParams uploadFileParams,
  );
  Future<Either<Failure, ReadFileResponse>> readFile(
    ReadFileParams readFileParams,
  );
  Future<Either<Failure, DeleteFileResponse>> deleteFile(
    DeleteFileParams deleteFileParams,
  );
  Future<Either<Failure, AuthenticateFileResponse>> authenticateFile(
    AuthenticateFileParams authenticateFileParams,
  );
  Future<Either<Failure, SelectFileResponse>> selectFile();
}
