import 'package:flutter/material.dart';
import 'package:mvvm/commons/exports.dart';
import 'package:mvvm/features/exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignment',
      theme: AppTheme.appLightTheme(),
      home: const LoadingPage(),
    );
  }
}
