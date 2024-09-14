class User {
  final int exp;
  final int iat;
  final int userId;
  final String email;
  final String fullName;

  const User({
    required this.exp,
    required this.iat,
    required this.userId,
    required this.email,
    required this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      exp: json['exp'],
      iat: json['iat'],
      userId: json['userId'],
      email: json['email'],
      fullName: json['fullName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'exp': exp,
      'iat': iat,
      'userId': userId,
      'email': email,
      'fullName': fullName,
    };
  }

  @override
  String toString() {
    return 'User{exp: $exp, iat: $iat, userId: $userId, email: $email, fullName: $fullName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          exp == other.exp &&
          iat == other.iat &&
          userId == other.userId &&
          email == other.email &&
          fullName == other.fullName;

  @override
  int get hashCode =>
      exp.hashCode ^
      iat.hashCode ^
      userId.hashCode ^
      email.hashCode ^
      fullName.hashCode;
}
