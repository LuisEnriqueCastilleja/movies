import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/navigation/routes.dart';

//Archivo que contiene la navegaciona todas las paginas.
class Navigation {
  //Navegar a la pagina donde escoge el tipo de peliculas que le gustan
  void goToKindOfMoviesTvPeople() {
    Modular.to.pushNamed(Routes.kindOfMoviesTvPeople.path);
  }

//Navegar a la pagina principal que es donde contiene mis 4 paginas de HomePage, ActivityPage, MyListsPage, SearchPage
  void goToMainPage() {
    Modular.to.pushNamed(Routes.mainPage.path);
  }

//Navegar a la pagina de peliculas donde puede buscar por poulares, mejor calificadas, proximas, etc
  void goToMoviesPage() {
    Modular.to.pushNamed(Routes.moviesPage.path);
  }

//Navegar a la pagina de series donde puede buscar por poulares, mejor calificadas, proximas, etc
  void goToSeriesPage() {
    Modular.to.pushNamed(Routes.seriesPage.path);
  }

//Navegar a la pagina de actores populares
  void goToPopularActorsPage() {
    Modular.to.pushNamed(Routes.popularActorsPage.path);
  }

//Navegar a la pagina de TV series en tendencia
  void goToOnTrendPage() {
    Modular.to.pushNamed(Routes.onTrendPage.path);
  }

//Navegar a la pagina de TV series mas populares
  void goToMostPopularTvSeriesPage() {
    Modular.to.pushNamed(Routes.mostPopularTvSeries.path);
  }

//Navegar a la pagina de las series mejor calificadas
  void goToTopRatedTvSeriesPage() {
    Modular.to.pushNamed(Routes.topRatedTvSeries.path);
  }
}
