import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/navigation/routes.dart';

class Navigation {
  void goToKindOfMoviesTvPeople() {
    Modular.to.pushNamed(Routes.kindOfMoviesTvPeople.path);
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

  void goToOnTrendPage() {
    Modular.to.pushNamed(Routes.onTrendPage.path);
  }

  void goToMostPopularTvSeriesPage() {
    Modular.to.pushNamed(Routes.mostPopularTvSeries.path);
  }

  void goToTopRatedTvSeriesPage() {
    Modular.to.pushNamed(Routes.topRatedTvSeries.path);
  }
}
