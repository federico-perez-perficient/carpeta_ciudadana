class API {
  //URLS
  static const String auth_url = String.fromEnvironment('AUTH_URL');
  static const String buck_url = String.fromEnvironment('BUCK_URL');

  //Auth
  static const String api_login = '$auth_url/users/login';
  static const String api_register = '$auth_url/users/signup';
  static const String api_logout = '$auth_url/users/logout';

  //File
  static const String file_upload = '$buck_url/upload';
  static const String file_delete = '$buck_url/remove';
  static const String file_read = '$buck_url/list';
  static const String file_auth = '$buck_url/authenticate-documents';

  //Operator
  static const String transfer_operator = '$auth_url/transfer-user';
}
