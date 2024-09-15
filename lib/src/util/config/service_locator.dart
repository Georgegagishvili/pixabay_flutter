import 'package:get_it/get_it.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

final GetIt locator = GetIt.instance;

void setupServiceLocator() {
  locator.registerLazySingleton<UserHive>(() => UserHive());
  locator.registerLazySingleton<HttpService>(() => HttpService());
  locator.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(client: locator<HttpService>()),
  );
  locator.registerFactory(
    () => LoginCubit(loginRepository: locator<LoginRepository>()),
  );
  locator.registerLazySingleton<RegisterRepository>(
    () => RegisterRepositoryImpl(client: locator<HttpService>()),
  );
  locator.registerFactory(
    () => RegisterCubit(registerRepository: locator<RegisterRepository>()),
  );
  locator.registerLazySingleton<GalleryRepository>(
    () => GalleryRepositoryImpl(client: locator<HttpService>()),
  );
  locator.registerFactory(
    () => GalleryBloc(galleryRepository: locator<GalleryRepository>()),
  );
}
