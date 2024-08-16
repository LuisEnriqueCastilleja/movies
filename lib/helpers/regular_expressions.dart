import 'package:flutter/services.dart';

class RegularExpressions {
  static numbers0_9() {
    return FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  }

  static twoNumbersAfterDecimal() {
    return FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}"));
  }
}
