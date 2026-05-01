import 'dart:math' as math;
import 'package:cosmatic_e_commerce/controllers/splash_screen_controller.dart';
import 'package:cosmatic_e_commerce/helpers/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  static const String routeName = '/';
  final SplashScreenController controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// Top Left Orange Slice
          Positioned(
            top: height * 0.183,
            left: -width * 0.14,

            child: Transform.rotate(
              angle: math.pi / 4,
              child: Image.asset(
                'assets/images/background_images/17_orange_slice.png',
                width: 300,
              ),
            ),
          ),

          /// Top Right Purple Paint
          Positioned(
            top: height * 0.018,
            right: -width * 0.004,
            child: Image.asset('assets/images/background_images/39_purple_paint.png', width: 200),
          ),

          /// Bottom Left Foundation Smear
          Positioned(
            bottom: (height * 0.25) - 65,
            left: -width * 0.1,
            child: Transform.flip(
              flipY: true,
              flipX: true,
              child: Image.asset(
                'assets/images/background_images/38_cream_dollop.png',
                width: 150,
              ),
            ),
          ),

          Positioned(
            bottom: height * 0.25,
            left: -width * 0.1 - 30,
            child: Transform.flip(
              flipX: true,
              child: Image.asset(
                'assets/images/background_images/38_cream_dollop.png',
                width: 140,
              ),
            ),
          ),

          /// Bottom Right Lemon Slice
          Positioned(
            bottom: height * 0.15,
            right: -width * 0.3,
            child: Transform.flip(
              flipY: true,
              child: Image.asset(
                'assets/images/background_images/25_lemon_slice_round.png',
                width: 250,
              ),
            ),
          ),

          /// Bottom Center Flower
          Positioned(
            bottom: -height * 0.1,
            left: width * 0.2 + 15,
            child: Image.asset('assets/images/background_images/21_calla_lily.png', width: 240),
          ),

          /// Center Logo + Text
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/images/logos/splash_screen_logo.png', width: 250),
                SizedBox(height: height * 0.015),
                Text(
                  'STRUCTURE.   SKIN.   SOUL',
                  style: TextStyle(
                    fontFamily: Fonts.generalSans,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    // letterSpacing: 2,
                    // color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
