import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:mvvm/src/util/exports.dart';

extension JWTExtension on Map {
  String get toJWT {
    final jwt = JWT(this);
    return jwt.sign(SecretKey(Constants.JWT_SECRET));
  }
}
