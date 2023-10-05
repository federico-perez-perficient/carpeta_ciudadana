class SignInResponse {
  final bool error;
  final String message;
  final Data data;

  SignInResponse({
    required this.error,
    required this.message,
    required this.data,
  });
}

class Data {
  final DateTime expiry;
  final String idCard;
  final String name;
  final String token;

  Data({
    required this.expiry,
    required this.idCard,
    required this.name,
    required this.token,
  });
}
