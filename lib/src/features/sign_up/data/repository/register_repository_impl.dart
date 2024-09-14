import 'package:mvvm/src/commons/exceptions/api_exceptions.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({required this.client});

  final HttpService client;

  @override
  Future<ApiResource<String>> signUp(RegisterPayload credentials) async {
    await Future.delayed(const Duration(milliseconds: 1200));

    final userExists = locator<UserHive>().exists(
      credentials.email,
    );

    if (userExists) {
      return ApiResource.error(
        CustomExceptions.USER_ALREADY_EXISTS,
      );
    }

    final String userToken =
        locator<UserHive>().saveUser(credentials.toJson().toJWT);

    return ApiResource.success(userToken);
  }
}
