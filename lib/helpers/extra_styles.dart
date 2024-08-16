import 'package:flutter/material.dart';

//Para crear espacios en vertical y horizontal en nuestra aplicacion para no implementar muchos Padding o Container con margin
class ExtraStyles {
  //Para cuando quiero espacio vertical y para no agregar margins
  static SizedBox boxHeight05 = const SizedBox(height: 5.0);
  static SizedBox boxHeight10 = const SizedBox(height: 10.0);
  static SizedBox boxHeight20 = const SizedBox(height: 20.0);
  static SizedBox boxHeight30 = const SizedBox(height: 30.0);
  static SizedBox boxHeight40 = const SizedBox(height: 40.0);
  static SizedBox boxHeight50 = const SizedBox(height: 50.0);

  //Para cuando quiero espacio horizontal y para no agregar margins
  static SizedBox boxWidth05 = const SizedBox(width: 5.0);
  static SizedBox boxWidth10 = const SizedBox(width: 10.0);
}
