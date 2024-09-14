class LoginPayload {
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
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LoginPayload &&
        other.username == username &&
        other.password == password;
  }

  @override
  int get hashCode {
    return username.hashCode ^ password.hashCode;
  }
}
