import 'package:carpeta_ciudadana/core/env/env_manager.dart';

class API {
  static const String base_url = Env.base_url;
  static const String api_auth = '/api/auth';
  static const String api_refresh_token = '/api/auth/refreshtoken';
  static const String api_register = '/api/users/register';
}
