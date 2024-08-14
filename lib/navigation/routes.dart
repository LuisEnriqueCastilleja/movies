enum Routes {
  splash,
  check,
  kindOfMoviesTvPeople,
  mainPage,
  moviesPage,
  seriesPage,
  popularActorsPage,
}

extension RoutesExtension on Routes {
  String get path {
    switch (this) {
      case Routes.splash:
        return '/splash';
      case Routes.check:
        return '/check_auth';
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
      default:
        return '';
    }
  }
}
