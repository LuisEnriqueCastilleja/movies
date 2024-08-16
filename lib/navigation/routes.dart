//Enumerado de las rutas de mi pagina
enum Routes {
  splash,
  check,
  kindOfMoviesTvPeople,
  mainPage,
  moviesPage,
  seriesPage,
  popularActorsPage,
  onTrendPage,
  mostPopularTvSeries,
  topRatedTvSeries,
}

extension RoutesExtension on Routes {
  //Listado de rutas de mis paginas.
  String get path {
    switch (this) {
      case Routes.splash:
        return '/splash';
      case Routes.kindOfMoviesTvPeople:
        return '/kind_of_movies_tv_people';
      case Routes.mainPage:
        return '/main_page';
      case Routes.moviesPage:
        return '/movies_page';
      case Routes.seriesPage:
        return '/series_page';
      case Routes.popularActorsPage:
        return '/popular_actors_page';
      case Routes.onTrendPage:
        return '/on_trend_page';
      case Routes.mostPopularTvSeries:
        return '/most_popular_tv_series_page';
      case Routes.topRatedTvSeries:
        return '/top_rated_tv_series_page';
      default:
        return '';
    }
  }
}
