import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtpScreenController extends GetxController {

  // ── OTP input state ────────────────────────────────────────────
  final TextEditingController textController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  // 4 digits stored individually for box rendering
  final RxList<String> otp = ['', '', '', ''].obs;

  final RxBool isInvalid = false.obs; // red state
  final RxBool isValid   = false.obs; // black filled state

  // ── Resend / countdown ─────────────────────────────────────────
  final RxBool   canResend  = false.obs;
  final RxString timerText  = '00:30'.obs;
  Timer? _timer;
  int _secondsLeft = 30;

  late final TapGestureRecognizer resendTapRecognizer;

  // ── Lifecycle ──────────────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    resendTapRecognizer = TapGestureRecognizer()..onTap = _onResendTapped;
    _startTimer();

    // Auto-open keyboard on arrival
    WidgetsBinding.instance.addPostFrameCallback((_) {
      focusNode.requestFocus();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    textController.dispose();
    focusNode.dispose();
    resendTapRecognizer.dispose();
    super.onClose();
  }

  // ── OTP input handler ──────────────────────────────────────────
  void onOtpChanged(String value) {
    // Reset states on any new input
    isInvalid.value = false;
    isValid.value   = false;

    // Fill boxes from left
    for (int i = 0; i < 4; i++) {
      otp[i] = i < value.length ? value[i] : '';
    }

    // Auto-verify when all 4 digits are entered
    if (value.length == 4) {
      _verifyOtp(value);
    }
  }

  // ── OTP verification ───────────────────────────────────────────
  void _verifyOtp(String code) {
    // TODO: Replace with your real API call
    // For now: any code ending in even digit = valid (demo logic)
    final lastDigit = int.tryParse(code[3]) ?? -1;
    if (lastDigit % 2 == 0) {
      isValid.value   = true;
      isInvalid.value = false;
      // TODO: Navigate to next screen
      // Get.offNamed(HomeScreen.routeName);
    } else {
      isInvalid.value = true;
      isValid.value   = false;
    }
  }

  // ── Countdown timer ────────────────────────────────────────────
  void _startTimer() {
    _secondsLeft = 30;
    canResend.value = false;
    _updateTimerText();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      _secondsLeft--;
      _updateTimerText();
      if (_secondsLeft <= 0) {
        t.cancel();
        canResend.value = true;
      }
    });
  }

  void _updateTimerText() {
    final mins = (_secondsLeft ~/ 60).toString().padLeft(2, '0');
    final secs = (_secondsLeft % 60).toString().padLeft(2, '0');
    timerText.value = '$mins:$secs';
  }

  void _onResendTapped() {
    if (!canResend.value) return;

    // Reset OTP boxes
    textController.clear();
    otp.assignAll(['', '', '', '']);
    isInvalid.value = false;
    isValid.value   = false;

    // Restart timer
    _startTimer();

    // TODO: Call your resend OTP API here
    Get.snackbar(
      'Code Resent',
      'A new access code has been dispatched.',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    );
  }
}