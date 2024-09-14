import 'package:hive_ce/hive.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class UserHive {
  static const String _boxName = 'userBox';

  Box get _box => Hive.box(_boxName);

  Future<void> setInitialUsers() async {
    await Hive.openBox(_boxName);
    _box.put(_boxName, RegisteredUsers.mockUsers);
  }

  bool exists(String email) {
    final List<String> currentUsers =
        _box.get(_boxName, defaultValue: <String>[]);
    return currentUsers.any((String userToken) {
      final User user = User.fromJson(userToken.parseJWT!);
      return user.email == email;
    });
  }

  bool areCredentialsValid(LoginPayload credentials) {
    if (credentials.username == null || credentials.password == null) {
      return false;
    }

    final String email = credentials.username!;
    final String password = credentials.password!;
    final List<String> currentUsers =
        _box.get(_boxName, defaultValue: <String>[]);
    return currentUsers.any((String userToken) {
      final User user = User.fromJson(userToken.parseJWT!);
      return user.email == email && user.password == password;
    });
  }

  User? getUser(String email) {
    final List<String> currentUsers =
        _box.get(_boxName, defaultValue: <String>[]);

    if (!exists(email)) {
      return null;
    }

    final String userToken = currentUsers.firstWhere((String userToken) {
      final User user = User.fromJson(userToken.parseJWT!);
      return user.email == email;
    });
    return User.fromJson(userToken.parseJWT!);
  }

  void saveUser(String token) {
    final Box box = Hive.box(_boxName);
    final List<String> currentUsers =
        box.get(_boxName, defaultValue: <String>[]);
    currentUsers.add(token);
    box.put(
      _boxName,
      currentUsers.toSet().toList(),
    );
  }

  List<User> getUsers() {
    final List<String>? tokens = _box.get(_boxName);

    if (tokens == null) {
      return [];
    }

    return tokens
        .map((String token) => User.fromJson(token.parseJWT!))
        .toList();
  }
}
