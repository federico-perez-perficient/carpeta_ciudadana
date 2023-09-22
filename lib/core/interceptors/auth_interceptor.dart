// import 'package:dio/dio.dart';

// import 'package:carpeta_ciudadana/core/base/base_remote_data_source.dart';

// import 'package:carpeta_ciudadana/core/constants/api.dart';
// import 'package:carpeta_ciudadana/core/constants/constants.dart';
// import 'package:carpeta_ciudadana/features/signin/data/models/sign_in_token_payload_model.dart';

// class AuthInterceptor extends Interceptor with BaseRemoteDataSourceImpl {

//   @override
//   void onRequest(
//       RequestOptions options, RequestInterceptorHandler handler) async {
//     print('REQUEST[${options.method}] => PATH: ${options.path}');

//     if (options.path == API.api_register) {
//       final String bearerToken =
//           await secureStorage.read(key: Constants.securedToken);
//       options.headers['Authorization'] = 'Bearer $bearerToken';
//     } else if (options.path == API.api_voting_system) {
//       final String bearerToken =
//           await secureStorage.read(key: Constants.securedToken);
//       options.headers['Authorization'] = 'Bearer $bearerToken';
//     } else if (options.path == API.api_room) {
//       final String bearerToken =
//           await secureStorage.read(key: Constants.securedToken);
//       options.headers['Authorization'] = 'Bearer $bearerToken';
//     } else if (options.path == API.api_story) {
//       final String bearerToken =
//           await secureStorage.read(key: Constants.securedToken);
//       options.headers['Authorization'] = 'Bearer $bearerToken';
//     }

//     if (options.path == API.api_refresh_token) {
//       addCookie(options: options);
//     }

//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(Response response, ResponseInterceptorHandler handler) async {
//     print(
//       'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
//     );

//     if (response.requestOptions.path == API.api_auth) {
//       secureTokenUserData(token: response.data["token"]);
//       secureCookie(response: response);
//     }

//     super.onResponse(response, handler);
//   }

//   @override
//   Future onError(DioException err, ErrorInterceptorHandler handler) async {
//     print(
//       'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
//     );
//     print(err);

//     if (err.response?.statusCode == 401) {
//       secureCookie(
//         response: await refreshToken.refreshToken(err.response!.requestOptions),
//       );
//       await httpRetry.retry(
//         requestOptions: err.response!.requestOptions,
//         maxRetries: 3,
//         delayMilliseconds: 500,
//       );
//     }

//     super.onError(err, handler);
//   }

//   void secureTokenUserData({required String token}) async {
//     final decodedSignInToken = SignInTokenPayloadModel.fromToken(token);

//     await secureStorage.write(key: Constants.securedToken, value: token);
//     await secureStorage.write(
//       key: Constants.securedUserName,
//       value: decodedSignInToken.name,
//     );
//     await secureStorage.write(
//       key: Constants.securedUserLastName,
//       value: decodedSignInToken.lastName,
//     );
//     await secureStorage.write(
//       key: Constants.securedUserEmail,
//       value: decodedSignInToken.email,
//     );
//     await secureStorage.write(
//       key: Constants.securedUserGuid,
//       value: decodedSignInToken.userGuid,
//     );
//     await secureStorage.write(
//       key: Constants.securedUserPhoto,
//       value: decodedSignInToken.photo,
//     );
//     await secureStorage.write(
//       key: Constants.securedSignInTokenExp,
//       value: decodedSignInToken.exp.toString(),
//     );
//   }

//   void secureCookie({required Response response}) async {
//     final cookieRT = response.headers['set-cookie']
//         ?.firstWhere((element) => element.contains('RefreshToken='));
//     if (cookieRT != null) {
//       await secureStorage.write(
//         key: Constants.securedRefreshToken,
//         value: cookieRT,
//       );
//     } else {
//       return;
//     }
//   }

//   void addCookie({required RequestOptions options}) async {
//     options.headers['cookie'] =
//         await secureStorage.read(key: Constants.securedRefreshToken);
//   }
// }
