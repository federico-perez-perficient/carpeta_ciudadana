import 'package:dio/dio.dart';

import 'package:carpeta_ciudadana/core/http/custom_http_client.dart';

abstract class HttpRetry {
  Future<void> retry({
    required RequestOptions requestOptions,
    required int maxRetries,
    required int delayMilliseconds,
    int retryCount,
  });
}

class HttpRetryImpl implements HttpRetry {
  final CustomHttpClient client;

  HttpRetryImpl({required this.client});

  @override
  Future<void> retry({
    required RequestOptions requestOptions,
    required int maxRetries,
    required int delayMilliseconds,
    int retryCount = 0,
  }) async {
    try {
      await client.request(requestOptions: requestOptions);
    } catch (exception) {
      if (retryCount < maxRetries) {
        final nextCount = retryCount + 1;
        final retryInMilliseconds = delayMilliseconds * nextCount;

        await Future.delayed(Duration(milliseconds: retryInMilliseconds));

        await retry(
          requestOptions: requestOptions,
          maxRetries: maxRetries,
          retryCount: nextCount,
          delayMilliseconds: delayMilliseconds,
        );
      } else {
        rethrow;
      }
    }
  }
}
