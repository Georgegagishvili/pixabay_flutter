import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class LoginCubit extends Cubit<ApiResource<String>> {
  final LoginRepository loginRepository;

  LoginCubit({required this.loginRepository}) : super(ApiResource.initial());

  Future<ApiResource<String>> login(LoginPayload payload) async {
    emit(ApiResource.loading());
    final ApiResource<String> loginResult =
        await loginRepository.login(payload);
    emit(loginResult);

    if (loginResult.data != null) {
      Preferences.instance.setString(
        PreferenceKeys.USER_TOKEN,
        loginResult.data,
      );
    }

    return loginResult;
  }

  void setUserToken(String token) {
    emit(ApiResource.success(token));
  }

  Future<void> logout() async {
    Preferences.instance.removeKey(PreferenceKeys.USER_TOKEN);
  }
}
