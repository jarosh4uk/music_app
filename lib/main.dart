import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:music_app/common/color_constants.dart';
import 'package:music_app/view/main_tabview/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music player',
      theme: ThemeData(
        scaffoldBackgroundColor: tColor.bg,
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: tColor.primaryText,
          displayColor: tColor.primary,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: tColor.primary),
        useMaterial3: false,
      ),
      home: const SplashView(),
    );
  }
}
