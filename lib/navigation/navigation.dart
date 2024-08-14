import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/navigation/routes.dart';

class Navigation {
  void goToCheckAuth() {
    Modular.to.pushNamed(Routes.check.path);
  }

  void goToMainPage() {
    Modular.to.pushNamed(Routes.mainPage.path);
  }

  void goToMoviesPage() {
    Modular.to.pushNamed(Routes.moviesPage.path);
  }

  void goToSeriesPage() {
    Modular.to.pushNamed(Routes.seriesPage.path);
  }

  void goToPopularActorsPage() {
    Modular.to.pushNamed(Routes.popularActorsPage.path);
  }
}
