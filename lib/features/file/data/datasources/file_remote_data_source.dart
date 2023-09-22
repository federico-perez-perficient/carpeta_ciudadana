import 'dart:typed_data';

import 'package:carpeta_ciudadana/core/constants/api.dart';
import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';
import 'package:carpeta_ciudadana/features/file/data/models/upload_file_params_model.dart';
import 'package:carpeta_ciudadana/features/file/data/models/upload_file_response_model.dart';
import 'package:carpeta_ciudadana/features/file/domain/entities/upload_file_response.dart';

abstract class FileRemoteDataSource {
  Future<UploadFileResponse> uploadFile(Uint8List file);
}

class FileRemoteDataSourceImpl extends FileRemoteDataSource {
  final CustomHttpClient client;

  FileRemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<UploadFileResponse> uploadFile(Uint8List file) async {
    final jsonData = await client.post(
      path: API.api_register,
      body: UploadFileParamsModel(filePickerResult: file).toJson(),
    );
    return UploadFileResponseModel.fromMap(jsonData.data);
  }
}
