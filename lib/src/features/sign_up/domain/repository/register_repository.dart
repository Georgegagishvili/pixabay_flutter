import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

abstract interface class RegisterRepository {
  Future<ApiResource<String>> signUp(
    RegisterPayload credentials,
  );
}
