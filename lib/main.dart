import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/app/app_module.dart';
import 'package:movies/app/app_widget.dart';

//Aqui decimos que nuestra app trabajara modularmente y pasamos el AppModule y el AppWidget
//El AppModule contiene lo del routeo y los repositorios.
//Y el AppWidget es el que especifica lo del routerConfig y lo principal de la aplicacion
void main() {
  return runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
