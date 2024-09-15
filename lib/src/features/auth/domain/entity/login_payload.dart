import 'package:equatable/equatable.dart';

class LoginPayload extends Equatable {
  final String? username;
  final String? password;

  const LoginPayload({
    this.username,
    this.password,
  });

  factory LoginPayload.fromJson(Map<String, dynamic> json) {
    return LoginPayload(
      username: json['username'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'usernameOrEmail': username,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'LoginPayload(username: $username, password: $password)';
  }

  @override
  List<Object?> get props => [username, password];
}
