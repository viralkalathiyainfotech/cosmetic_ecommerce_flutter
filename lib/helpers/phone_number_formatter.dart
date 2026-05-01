import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove all non-digits
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    // Limit to 10 digits
    if (digits.length > 10) {
      digits = digits.substring(0, 10);
    }

    String formatted = '';

    if (digits.length <= 3) {
      formatted = digits;
    } else if (digits.length <= 6) {
      formatted = '${digits.substring(0, 3)} ${digits.substring(3)}';
    } else {
      formatted =
          '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}