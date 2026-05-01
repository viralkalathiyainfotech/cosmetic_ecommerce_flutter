import 'package:cosmatic_e_commerce/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreenController extends GetxController {
  final RxString phoneNumber = ''.obs;
  final RxBool termsAccepted = false.obs;
  final FocusNode phoneFocusNode = FocusNode();
  final isFocused = false.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    phoneFocusNode.addListener(() {
      isFocused.value = phoneFocusNode.hasFocus;
    });
    super.onInit();
  }

  void toggleTerms() => termsAccepted.value = !termsAccepted.value;

  /// ✅ VALIDATION (India format)
  bool isValidPhone() {
    return RegExp(r'^[6-9][0-9]{9}$').hasMatch(phoneNumber.value);
  }

  void sendAccessCode() {
    if (!isValidPhone() || !termsAccepted.value) return;

    // Simulate sending access code
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.toNamed(OtpScreen.routeName, arguments: phoneNumber.value)!.then((_) {
        phoneNumber.value = '';
        termsAccepted.value = false;
      });
    });
  }
}
