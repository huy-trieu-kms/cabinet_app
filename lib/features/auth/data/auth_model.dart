class LoginRequest {
  final String username;
  final String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}

class LoginResponse {
  final String username;
  final String displayName;
  final String token;

  LoginResponse({
    required this.username,
    required this.displayName,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      username: json['username'] as String,
      displayName: json['displayName'] as String,
      token: json['token'] as String,
    );
  }
}
