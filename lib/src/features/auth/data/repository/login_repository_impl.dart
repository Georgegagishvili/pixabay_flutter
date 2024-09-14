import 'package:mvvm/src/commons/exceptions/api_exceptions.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl({required this.client});

  final HttpService client;

  @override
  Future<ApiResource<String>> login(LoginPayload credentials) async {
    await Future.delayed(const Duration(milliseconds: 1200));

    final areCredentialsValid = locator<UserHive>().areCredentialsValid(
      credentials,
    );

    if (!areCredentialsValid) {
      return ApiResource.error(CustomExceptions.INVALID_CREDENTIALS);
    }

    final User user = locator<UserHive>().getUser(credentials.username!)!;

    return ApiResource.success(user.toJson().toJWT);
  }
}
