import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_response.dart';
import 'package:dartz/dartz.dart';

import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_response.dart';
import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:carpeta_ciudadana/core/failures/failures.dart';
import 'package:carpeta_ciudadana/features/file/data/datasources/file_local_data_source.dart';
import 'package:carpeta_ciudadana/features/file/data/datasources/file_remote_data_source.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/select_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/repositories/file_repository.dart';

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
      final UploadFileResponse uploadFileResponse =
          await fileRemoteDataSource.uploadFile(uploadFileParams);
      return Right(uploadFileResponse);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, SelectFileResponse>> selectFile() async {
    try {
      final file = await fileLocalDataSource.readLocalFile();
      return Right(SelectFileResponse(
        fileName: file.fileName,
        filePickerResult: file.filePickerResult,
      ));
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, ReadFileResponse>> readFile(
      ReadFileParams readFileParams) async {
    try {
      final response = await fileRemoteDataSource.readFile(readFileParams);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, AuthenticateFileResponse>> authenticateFile(
      AuthenticateFileParams authenticateFileParams) async {
    try {
      final response =
          await fileRemoteDataSource.authenticateFile(authenticateFileParams);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error'));
    }
  }

  @override
  Future<Either<Failure, DeleteFileResponse>> deleteFile(
      DeleteFileParams deleteFileParams) async {
    try {
      final response = await fileRemoteDataSource.deleteFile(deleteFileParams);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Error'));
    }
  }
}
