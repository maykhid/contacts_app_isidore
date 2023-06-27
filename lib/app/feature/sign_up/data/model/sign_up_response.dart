class SignUpResponse {
  SignUpResponse({
    required this.signup,
  });
  factory SignUpResponse.fromMap(Map<String, dynamic> json) => SignUpResponse(
        signup: Signup.fromMap(json['signup'] as Map<String, dynamic>),
      );
  final Signup signup;
}

class Signup {
  Signup({
    required this.status,
    required this.user,
  });
  factory Signup.fromMap(Map<String, dynamic> json) => Signup(
        status: json['status'] as int,
        user: User.fromMap(json['user'] as Map<String, dynamic>),
      );
  final int status;
  final User user;
}

class User {
  User({
    required this.createdAt,
    required this.email,
    required this.id,
    required this.status,
    required this.updatedAt,
    this.tokens,
  });
  factory User.fromMap(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json['createdAt'].toString()),
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
  final dynamic tokens;
  final DateTime updatedAt;

}
