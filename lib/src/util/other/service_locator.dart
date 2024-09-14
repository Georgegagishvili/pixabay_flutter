import 'package:get_it/get_it.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(client: HttpService.instance),
  );
  locator.registerFactory(
    () => LoginCubit(loginRepository: locator<LoginRepository>()),
  );
}
