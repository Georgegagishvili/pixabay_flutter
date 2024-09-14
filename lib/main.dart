import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mvvm/app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mvvm/src/util/exports.dart';


Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  setupServiceLocator();
  final prefs = await SharedPreferences.getInstance();
  Preferences.create(prefs);
}

void main() async {
  await init();
  runApp(const MyApp());
}
