import 'package:get_it/get_it.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<UserHive>(() => UserHive());

  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(client: HttpService.instance),
  );
  locator.registerFactory(
    () => LoginCubit(loginRepository: locator<LoginRepository>()),
  );
  locator.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(client: HttpService.instance),
  );
  locator.registerFactory(
    () => RegisterCubit(registerRepository: locator<RegisterRepository>()),
  );
}
