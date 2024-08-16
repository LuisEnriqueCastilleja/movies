import 'package:flutter/services.dart';

//Expresiones regulares que usa nuestra aplicacion aunque no las utilice al final de la app
class RegularExpressions {
  static numbers0_9() {
    //Para permitir solo numeros en un input
    return FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  }

  static twoNumbersAfterDecimal() {
    //Para permitir 2 digitos despues del punto decimal 
    return FilteringTextInputFormatter.allow(RegExp(r"^\d+\.?\d{0,2}"));
  }
}
