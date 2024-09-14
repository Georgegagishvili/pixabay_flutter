import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/extensions/map.dart';

final class RegisteredUsers {
  static List<String> get users => [
        const User(
          email: 'user1@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User One',
          userId: 1,
        ).toJson().toJWT,
        const User(
          email: 'user2@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Two',
          userId: 2,
        ).toJson().toJWT,
        const User(
          email: 'user3@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Three',
          userId: 3,
        ).toJson().toJWT,
        const User(
          email: 'user4@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Four',
          userId: 4,
        ).toJson().toJWT,
        const User(
          email: 'user5@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Five',
          userId: 5,
        ).toJson().toJWT,
      ];
}
