import 'package:flutter/services.dart';

class PositiveIntegerInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final String newText = newValue.text;
    if (int.tryParse(newText) != null && int.tryParse(newText)! < 0) {
      return oldValue.copyWith(
        text: '0',
        selection: TextSelection.fromPosition(
          const TextPosition(offset: 1),
        ),
      ); // Invalid input, revert to the old value
    }
    return newValue.copyWith(text: newText, selection: TextSelection.fromPosition(
      TextPosition(offset: newValue.text.length),
    ),);
  }
}
