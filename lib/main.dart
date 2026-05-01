import 'package:cosmatic_e_commerce/screens/onboarding_1_screen.dart';
import 'package:cosmatic_e_commerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      getPages: [
          GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
          GetPage(name: Onboarding1Screen.routeName, page: () => const Onboarding1Screen()),
          // GetPage(name: HomeScreen.routeName, page: () => const HomeScreen()),
      ],
      initialRoute: SplashScreen.routeName,
    );
  }
}
