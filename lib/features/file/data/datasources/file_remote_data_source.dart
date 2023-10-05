import 'package:dio/dio.dart';

import 'package:carpeta_ciudadana/features/file/data/models/delete_file_params.dart';
import 'package:carpeta_ciudadana/features/file/data/models/delete_file_response_model.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/delete_file_response.dart';
import 'package:carpeta_ciudadana/features/file/data/models/authenticate_file_params_model.dart';
import 'package:carpeta_ciudadana/features/file/data/models/authenticate_file_response_model.dart';
import 'package:carpeta_ciudadana/features/file/data/models/read_file_response_model.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/authenticate_file_response.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_params.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/read_file_response.dart';
import 'package:carpeta_ciudadana/core/exceptions/exceptions.dart';
import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_params.dart';
import 'package:carpeta_ciudadana/core/constants/api.dart';
import 'package:carpeta_ciudadana/features/file/data/models/upload_file_response_model.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';

abstract class FileRemoteDataSource {
  Future<UploadFileResponse> uploadFile(UploadFileParams uploadFileParams);
  Future<ReadFileResponse> readFile(ReadFileParams readFileParams);
  Future<DeleteFileResponse> deleteFile(DeleteFileParams deleteFileParams);
  Future<AuthenticateFileResponse> authenticateFile(
    AuthenticateFileParams authenticateFileParams,
  );
}

class FileRemoteDataSourceImpl extends FileRemoteDataSource {
  final CustomHttpClient client;

  FileRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<UploadFileResponse> uploadFile(
      UploadFileParams uploadFileParams) async {
    try {
      FormData data = FormData.fromMap({
        'input_files': MultipartFile.fromBytes(
          uploadFileParams.filePickerResult,
          filename: uploadFileParams.name,
        ),
      });
      final jsonData = await client.post(
        path: API.file_upload,
        body: data,
        headers: {'multipart': 'form-data'},
        parameters: {'folderName': uploadFileParams.userId},
      );
      if (jsonData.data["files"].toString() == "[]") {
        throw ServerException(message: '', errorCode: 400);
      } else {
        return UploadFileResponseModel.fromMap(jsonData.data);
      }
    } catch (e) {
      throw ServerException(message: '', errorCode: 400);
    }
  }

  @override
  Future<ReadFileResponse> readFile(ReadFileParams readFileParams) async {
    final jsonData = await client.get(
      path: API.file_read,
      parameters: {'folderName': readFileParams.userId.toString()},
    );
    return ReadFileResponseModel.fromJson(jsonData.data);
  }

  @override
  Future<AuthenticateFileResponse> authenticateFile(
      AuthenticateFileParams authenticateFileParams) async {
    final jsonData = await client.post(
      path: API.file_auth,
      body: AuthenticateFileParamsModel(
        idCitizen: authenticateFileParams.userId,
        keyId: authenticateFileParams.docKey,
        documentTitle: authenticateFileParams.docTitle,
      ).toJson(),
    );
    return AuthenticateFileResponseModel.fromMap(jsonData.data);
  }

  @override
  Future<DeleteFileResponse> deleteFile(
      DeleteFileParams deleteFileParams) async {
    print(deleteFileParams.fileKeys);
    final jsonData = await client.delete(
      path: API.file_delete,
      body: DeleteFileParamsModel(fileKeys: deleteFileParams.fileKeys).toJson(),
    );
    return DeleteFileResponseModel.fromMap(jsonData.data);
  }
}
