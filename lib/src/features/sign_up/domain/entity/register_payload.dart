class RegisterPayload {
  final String email;
  final String password;
  final String fullName;
  final int age;

  const RegisterPayload({
    required this.email,
    required this.password,
    required this.fullName,
    required this.age,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RegisterPayload &&
        other.email == email &&
        other.password == password &&
        other.fullName == fullName &&
        other.age == age;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        password.hashCode ^
        fullName.hashCode ^
        age.hashCode;
  }

  @override
  String toString() {
    return 'RegisterPayload(email: $email, password: $password, fullName: $fullName, age: $age)';
  }

  RegisterPayload copyWith({
    String? email,
    String? password,
    String? fullName,
    int? age,
  }) {
    return RegisterPayload(
      email: email ?? this.email,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fullName': fullName,
      'age': age,
    };
  }
}
