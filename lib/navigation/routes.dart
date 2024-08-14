enum Routes {
  splash,
  check,
  kindOfMoviesTvPeople,
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
      default:
        return '';
    }
  }
}
