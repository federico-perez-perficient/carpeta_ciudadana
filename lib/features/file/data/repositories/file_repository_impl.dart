import 'dart:io';
import 'dart:typed_data';

import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/file/data/datasources/file_local_data_source.dart';
import 'package:carpeta_ciudadana/features/file/data/datasources/file_remote_data_source.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';
import 'package:dartz/dartz.dart';

class FileRepositoryImpl extends FileRepository {
  final FileLocalDataSource fileLocalDataSource;
  final FileRemoteDataSource fileRemoteDataSource;

  FileRepositoryImpl({
    required this.fileLocalDataSource,
    required this.fileRemoteDataSource,
  });

  @override
  Future<Either<Failure, UploadFileResponse>> uploadFile(
      UploadFileParams uploadFileParams) async {
    try {
      final UploadFileResponse uploadFileResponse = await fileRemoteDataSource
          .uploadFile(uploadFileParams.filePickerResult);
      return Right(uploadFileResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Uint8List>> selectFile() async {
    try {
      final Uint8List file = await fileLocalDataSource.readLocalFile();
      return Right(file);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
