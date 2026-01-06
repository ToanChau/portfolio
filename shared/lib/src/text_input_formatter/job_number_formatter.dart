import 'package:flutter/services.dart';

class JobNumberFormatter extends TextInputFormatter {
  JobNumberFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final StringBuffer newText = StringBuffer();
    final List<String> chars = newValue.text.split('');

    for (int i = 0; i < chars.length; i++) {
      if (i == 3 || i == 7) {
        newText.write('.');
      }
      newText.write(chars[i]);
    }

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}