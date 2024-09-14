class User {
  final int exp;
  final int iat;
  final int age;
  final String email;
  final String fullName;
  final String password;

  const User({
    required this.exp,
    required this.iat,
    required this.age,
    required this.email,
    required this.fullName,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      exp: json['exp'],
      iat: json['iat'],
      email: json['email'],
      fullName: json['fullName'],
      age: json['age'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exp': exp,
      'iat': iat,
      'email': email,
      'fullName': fullName,
      'age': age,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'User{exp: $exp, iat: $iat, email: $email, fullName: $fullName, age: $age, password: $password}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          exp == other.exp &&
          iat == other.iat &&
          email == other.email &&
          fullName == other.fullName &&
          age == other.age &&
          password == other.password;

  @override
  int get hashCode =>
      exp.hashCode ^
      iat.hashCode ^
      email.hashCode ^
      fullName.hashCode ^
      age.hashCode ^
      password.hashCode;
}
