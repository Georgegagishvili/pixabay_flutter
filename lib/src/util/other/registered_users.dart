import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/extensions/map.dart';

final class RegisteredUsers {
  static List<String> get mockUsers => [
        const User(
          email: 'user1@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User One',
          userId: 1,
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
        const User(
          email: 'user2@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Two',
          userId: 2,
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
        const User(
          email: 'user3@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Three',
          userId: 3,
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
        const User(
          email: 'user4@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Four',
          userId: 4,
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
        const User(
          email: 'user5@gmail.com',
          exp: 1234567890,
          iat: 1234567890,
          fullName: 'User Five',
          userId: 5,
          age: 21,
          password: 'Test1234',
        ).toJson().toJWT,
      ];
}
