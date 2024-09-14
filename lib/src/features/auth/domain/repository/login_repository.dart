import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

abstract interface class LoginRepository {
  Future<ApiResource<String>> login(
    LoginPayload credentials,
  );
}
