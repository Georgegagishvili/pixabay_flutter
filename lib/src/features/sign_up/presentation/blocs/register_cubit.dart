import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class RegisterCubit extends Cubit<ApiResource<String>> {
  final RegisterRepository registerRepository;

  RegisterCubit({required this.registerRepository})
      : super(ApiResource.initial());

  Future<ApiResource<String>> signUp(RegisterPayload payload) async {
    emit(ApiResource.loading());
    final ApiResource<String> signUpResult =
        await registerRepository.signUp(payload);
    emit(signUpResult);

    if (signUpResult.data != null) {
      Preferences.instance.setString(
        PreferenceKeys.USER_TOKEN,
        signUpResult.data,
      );
    }

    return signUpResult;
  }
}
