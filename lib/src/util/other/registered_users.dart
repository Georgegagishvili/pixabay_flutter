import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/extensions/map.dart';

final class RegisteredUsers {
  static List<String> get mockUsers => [
        const User(
          email: 'user1@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User One',
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
        const User(
          email: 'user2@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Two',
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
        const User(
          email: 'user3@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Three',
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
        const User(
          email: 'user4@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Four',
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
        const User(
          email: 'user5@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Five',
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
      ];
}
