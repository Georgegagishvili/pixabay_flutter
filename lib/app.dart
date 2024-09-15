import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm/src/commons/exports.dart';
import 'package:mvvm/src/features/exports.dart';
import 'package:mvvm/src/util/exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (_) =>
              LoginCubit(loginRepository: locator<LoginRepository>()),
        ),
        BlocProvider<RegisterCubit>(
          create: (_) =>
              RegisterCubit(registerRepository: locator<RegisterRepository>()),
        ),
        BlocProvider<GalleryBloc>(
          create: (_) =>
              GalleryBloc(galleryRepository: locator<GalleryRepository>())
                ..add(GalleryFetched()),
        ),
        BlocProvider<ThemeCubit>(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Pixabay Gallery',
            theme: AppTheme.appLightTheme(lightColors),
            darkTheme: AppTheme.appDarkTheme(darkColors),
            themeMode: state,
            home: const LoadingPage(),
          );
        },
      ),
    );
  }
}
