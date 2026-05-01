import 'package:cosmatic_e_commerce/helpers/navigation_animations.dart';
import 'package:cosmatic_e_commerce/screens/onboarding_1_screen.dart';
import 'package:cosmatic_e_commerce/screens/onboarding_2_screen.dart';
import 'package:cosmatic_e_commerce/screens/onboarding_3_screen.dart';
import 'package:cosmatic_e_commerce/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cosmatic',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      getPages: [
        GetPage(name: SplashScreen.routeName, page: () => SplashScreen()),
        GetPage(
          name: Onboarding1Screen.routeName,
          page: () => const Onboarding1Screen(),
          customTransition: OnboardingTransition(),
          transitionDuration: const Duration(milliseconds: 380),
        ),
         GetPage(
          name: Onboarding2Screen.routeName,
          page: () => const Onboarding2Screen(),
          customTransition: OnboardingTransition(),
          transitionDuration: const Duration(milliseconds: 380),
        ),
         GetPage(
          name: Onboarding3Screen.routeName,
          page: () => const Onboarding3Screen(),
          customTransition: OnboardingTransition(),
          transitionDuration: const Duration(milliseconds: 380),
        ),
      ],
      initialRoute: SplashScreen.routeName,
    );
  }
}
