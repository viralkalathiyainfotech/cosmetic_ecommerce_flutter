import 'dart:math' as math;

import 'package:cosmatic_e_commerce/controllers/login_screen_controller.dart';
import 'package:cosmatic_e_commerce/helpers/fonts.dart';
import 'package:cosmatic_e_commerce/helpers/phone_number_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  static const String routeName = '/login';

  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background_images/main_background_image.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.515,
              child: Stack(
                children: [
                  
                  Positioned(
                    top: height * 0.15,
                    left: -width * 0.1,
                    child: Transform.rotate(
                      angle: (148.92) * math.pi / 180,
                      child: Image.asset(
                        'assets/images/background_images/40_peach_slice.png',
                        width: 150,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.1,
                    right: width * 0.28,
                    child: Transform.rotate(
                      angle: (-75) * math.pi / 180,
                      child: Transform.flip(
                        flipY: true,
                        child: Image.asset(
                          'assets/images/background_images/31_white_paint_stroke.png',
                          width: 135,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.28,
                    right: -width * 0.02,
                    child: Image.asset(
                      'assets/images/background_images/23_pink_flower.png',
                      width: 135,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
                ),
                child: SafeArea(
                  top: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const SizedBox(height: 10),
        
                      // ── Headline ─────────────────────────────────
                      const Text(
                        'UNVEIL YOUR\nRADIANCE.',
                        style: TextStyle(
                          fontSize: 50,
                          fontFamily: Fonts.generalSans,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -1,
                          height: 1.1,
                          color: Colors.black,
                        ),
                      ),
        
                      const SizedBox(height: 12),
        
                      // ── Subtitle ──────────────────────────────────
                      Text(
                        'Sign in with your global account to explore our bespoke collection.',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: Fonts.generalSans,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                          height: 1.5,
                        ),
                      ),
        
                      const SizedBox(height: 19.275),
        
                      // ── Phone number input ────────────────────────
                      Obx(
                        () => TextField(
                          focusNode: controller.phoneFocusNode,
                          keyboardType: TextInputType.phone,
        
                          /// ✅ FORMATTERS
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            PhoneNumberFormatter(),
                          ],
        
                          /// ✅ STORE ONLY DIGITS
                          onChanged: (value) {
                            controller.phoneNumber.value = value.replaceAll(
                              ' ',
                              '',
                            );
                          },
        
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: Fonts.generalSans,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
        
                          decoration: InputDecoration(
                            fillColor: const Color(0xFFF8F8F8),
                            filled: true,
                            hintText: 'Mobile Number',
        
                            hintStyle: TextStyle(
                              fontFamily: Fonts.generalSans,
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
        
                            prefixIcon: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '+91',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: Fonts.generalSans,
                                      color: controller.isFocused.value
                                          ? Colors.black
                                          : Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    width: 1,
                                    height: 14,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                            ),
        
                            suffixIcon: controller.phoneNumber.value.isNotEmpty
                                ? Icon(
                                    controller.isValidPhone()
                                        ? Icons.check_circle
                                        : Icons.error,
                                    color: controller.isValidPhone()
                                        ? Colors.green
                                        : Colors.red,
                                    size: 18,
                                  )
                                : null,
        
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1,
                              ),
                            ),
        
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                color: Colors.grey[400]!,
                                width: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 22),
        
                      // ── Terms checkbox ────────────────────────────
                      Obx(
                        () => GestureDetector(
                          onTap: controller.toggleTerms,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: controller.termsAccepted.value
                                      ? Colors.black
                                      : Colors.transparent,
                                  border: Border.all(
                                    color: controller.termsAccepted.value
                                        ? Colors.black
                                        : Colors.grey[400]!,
                                    width: 1.2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: controller.termsAccepted.value
                                    ? const Icon(
                                        Icons.check,
                                        size: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      fontFamily: Fonts.generalSans,
                                      fontSize: 15,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                    children: [
                                      const TextSpan(text: 'Agree to '),
                                      TextSpan(
                                        text: 'Terms & Privacy',
                                        style: const TextStyle(
                                          color: Color(0xFFEC221F),
                                          decoration: TextDecoration.underline,
                                          // fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const TextSpan(text: ' to continue.'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
        
                      SizedBox(height: 16),
        
                      // ── Send Access Code button ───────────────────
                      Obx(
                        () => SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed:
                                controller.termsAccepted.value &&
                                    controller.phoneNumber.value.isNotEmpty
                                ? controller.sendAccessCode
                                : null,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              disabledBackgroundColor: Color(0xFFA0A0A0),
                              foregroundColor: Colors.white,
                              disabledForegroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'SEND ACCESS CODE',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: Fonts.generalSans,
                                fontWeight: FontWeight.w500,
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
      ),
    );
  }
}
