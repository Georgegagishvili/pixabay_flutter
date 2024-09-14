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
          create: (_) => LoginCubit(loginRepository: locator<LoginRepository>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Assignment',
        theme: AppTheme.appLightTheme(lightColors),
        darkTheme: AppTheme.darkTheme(darkColors),
        themeMode: ThemeMode.dark,
        home: const LoadingPage(),
      ),
    );
  }
}
