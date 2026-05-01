import 'dart:math' as math;

import 'package:cosmatic_e_commerce/controllers/otp_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static const String routeName = '/otp';

  @override
  Widget build(BuildContext context) {
    final OtpScreenController controller = Get.put(OtpScreenController());
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          /// 🌿 FULL BACKGROUND
          Positioned.fill(
            child: Image.asset(
              'assets/images/background_images/main_background_image.png',
              fit: BoxFit.cover,
            ),
          ),

          /// 🍓 DECORATIONS
          Positioned(
            top: height * 0.22,
            left: -width * 0.28,
            child: Transform.rotate(
              angle: 90 * math.pi / 180,
              child: Image.asset(
                'assets/images/background_images/16_strawberry.png',
                width: 325,
              ),
            ),
          ),

          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              'assets/images/background_images/22_white_lily.png',
              width: 200,
            ),
          ),

          Positioned(
            top: height * 0.38,
            right: -width * 0.15,
            child: Transform.rotate(
              angle: -90 * math.pi / 180,
              child: Image.asset(
                'assets/images/background_images/02_paint_blob_red.png',
                width: 200,
              ),
            ),
          ),

          /// 🧾 CONTENT (FLOATING, NOT BOXED)
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                24,
                0,
                24,
                48,
              ), // more bottom space
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// ❗ INVALID OTP
                  Obx(
                    () => controller.isInvalid.value
                        ? Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE5E5),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'INVALID OTP',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFD4513E),
                              ),
                            ),
                          )
                        : const SizedBox(height: 4),
                  ),

                  /// TITLE
                  const Text(
                    'AUTHENTICATE.',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w800,
                      height: 1.1,
                    ),
                  ),

                  const SizedBox(height: 12),

                  /// SUBTITLE
                  Text(
                    'A unique 4-digit access code has been dispatched\n'
                    'to your device for secure entry.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey[600],
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 32), // ⬅️ more breathing room
                  /// OTP BOXES
                  GestureDetector(
                    onTap: () => controller.focusNode.requestFocus(),
                    child: Obx(
                      () => Row(
                        children: List.generate(4, (i) {
                          final digit = controller.otp[i];
                          final isEmpty = digit == '';

                          final isInvalid = controller.isInvalid.value;
                          final isValid = controller.isValid.value;

                          Color borderColor;
                          Color textColor;

                          if (isInvalid) {
                            borderColor = const Color(0xFFD4513E);
                            textColor = const Color(0xFFD4513E);
                          } else if (isValid && !isEmpty) {
                            borderColor = Colors.black;
                            textColor = Colors.black;
                          } else {
                            borderColor = Colors.grey[300]!;
                            textColor = Colors.black;
                          }

                          return Container(
                            margin: EdgeInsets.only(
                              right: i != 3 ? 14 : 0,
                            ), // balanced spacing
                            width: 56,
                            height: 56,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: borderColor,
                                width: 1.2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              isEmpty ? '0' : digit,
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: isEmpty ? Colors.grey[400] : textColor,
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  /// RESEND OTP
                  Obx(
                    () => RichText(
                      text: TextSpan(
                        style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        children: [
                          const TextSpan(text: 'Resend OTP in : '),
                          controller.canResend.value
                              ? TextSpan(
                                  text: 'Resend OTP',
                                  recognizer: controller.resendTapRecognizer,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )
                              : TextSpan(
                                  text: controller.timerText.value,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  /// CHANGE NUMBER
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: const Text(
                      'CHANGE NUMBER',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.2,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
