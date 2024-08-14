import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/navigation/routes.dart';

class Navigation {
  void goToCheckAuth() {
    Modular.to.pushNamed(Routes.check.path);
  }
}
