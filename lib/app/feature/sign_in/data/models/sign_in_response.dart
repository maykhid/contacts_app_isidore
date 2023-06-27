import 'dart:convert';

SignInResponse signInResponseFromJson(String str) =>
    SignInResponse.fromMap(json.decode(str) as Map<String, dynamic>);


class SignInResponse {
  SignInResponse({
    required this.login,
  });
  factory SignInResponse.fromMap(Map<String, dynamic> json) => SignInResponse(
        login: Login.fromMap(json['login'] as Map<String, dynamic>),
      );
  final Login login;

}

class Login {
  Login({
    required this.status,
    required this.user,
  });
  factory Login.fromMap(Map<String, dynamic> json) => Login(
        user: User.fromMap(json['user'] as Map<String, dynamic>),
        status: json['status'] as int,
      );

  final User? user;

  final int status;

}

class User {
  User({
    required this.createdAt,
    required this.email,
    required this.id,
    required this.status,
    required this.tokens,
    required this.updatedAt,
  });
  factory User.fromMap(Map<String, dynamic>? json) => User(
        createdAt: DateTime.parse(json!['createdAt'].toString()),
        email: json['email'].toString(),
        id: json['id'].toString(),
        status: json['status'].toString(),
        tokens: json['tokens'].toString(),
        updatedAt: DateTime.parse(json['updatedAt'].toString()),
      );
  final DateTime createdAt;
  final String email;
  final String id;
  final String status;
  final String tokens;
  final DateTime updatedAt;
}
