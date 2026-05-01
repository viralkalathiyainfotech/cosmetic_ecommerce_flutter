import 'package:cosmatic_e_commerce/helpers/fonts.dart';
import 'package:cosmatic_e_commerce/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding3Screen extends StatelessWidget {
  const Onboarding3Screen({super.key});
  static const String routeName = '/onboarding3';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width  = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'assets/images/onboarding/onboarding_3_upper_image.png',
            width: width,
            height: height * 0.62,
            fit: BoxFit.cover,
          ),

          Expanded(
            child: SafeArea(
              top: false, 
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 32),
                      child: Column(
                        children: [
                          Text(
                            'THE HIGHEST \nSTANDARD.',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 45,
                              fontFamily: Fonts.generalSans,
                              fontWeight: FontWeight.w600,
                              height: 1.15,
                              letterSpacing: -0.5,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Formulated in Switzerland. Crafting the \nfuture of medical-grade skincare.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: Fonts.generalSans,
                              fontWeight: FontWeight.w500,
                              color: Colors.black.withOpacity(0.5),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // ── NEXT button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed(
                            LoginScreen.routeName,
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'GET STARTED',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}