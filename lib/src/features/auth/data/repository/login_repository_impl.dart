import 'package:mvvm/src/commons/exceptions/api_exceptions.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.client});

  final HttpService client;

  @override
  Future<ApiResource<String>> login(LoginPayload credentials) async {
    await Future.delayed(const Duration(seconds: 2));

    final currentUserTokens = RegisteredUsers.users;
    final exists = currentUserTokens.any((String token) {
      final User user = User.fromJson(token.parseJWT!);
      return user.email == credentials.username;
    });

    if (!exists) {
      return ApiResource.error(CustomExceptions.USER_NOT_FOUND);
    }

    /// ToDo. get user from DB as token
    return ApiResource.success('data');
  }
}
