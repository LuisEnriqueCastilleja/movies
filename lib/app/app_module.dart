import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/navigation/routes.dart';
import 'package:movies/pages/home/most_popular_tv_series/most_popular_tv_series_page.dart';
import 'package:movies/pages/home/home_movies/movies_page.dart';
import 'package:movies/pages/home/on_trend/on_trend_page.dart';
import 'package:movies/pages/home/popular_actors_page.dart';
import 'package:movies/pages/home/series_page.dart';
import 'package:movies/pages/home/top_rated_tv_series/top_rated_tv_series_page.dart';
import 'package:movies/pages/main/main_page.dart';
import 'package:movies/pages/movies/kind_of_movies_tv_people_page.dart';
import 'package:movies/repositories/popular_movies_respository.dart';
import 'package:movies/repositories/popular_tv_series_repository.dart';
import 'package:movies/repositories/movies_tv_people_repository.dart';
import 'package:movies/repositories/search_movie_repository.dart';
import 'package:movies/repositories/top_rated_tv_series_repository.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<Navigation>(() => Navigation());
    i.addLazySingleton<ApiBaseHelper>(() => ApiBaseHelper());
    i.addLazySingleton<MoviesTvPeopleRepository>(
        () => MoviesTvPeopleRepository());
    i.addLazySingleton<PopularTvSeriesRepository>(
        () => PopularTvSeriesRepository());
    i.addLazySingleton<TopRatedTvSeriesRepository>(
        () => TopRatedTvSeriesRepository());
    i.addLazySingleton<PopularMoviesRepository>(
        () => PopularMoviesRepository());
    i.addLazySingleton<SearchMoviesRepository>(() => SearchMoviesRepository());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const KindOfMoviesTvPeoplePage());
    r.child(Routes.kindOfMoviesTvPeople.path,
        child: (context) => const KindOfMoviesTvPeoplePage());
    r.child(Routes.mainPage.path, child: (context) => const MainPage());
    r.child(Routes.moviesPage.path, child: (context) => const MoviesPage());
    r.child(Routes.seriesPage.path, child: (context) => const SeriesPage());
    r.child(Routes.popularActorsPage.path,
        child: (context) => const PopularActorsPage());
    r.child(Routes.onTrendPage.path, child: (context) => const OnTrendPage());
    r.child(Routes.mostPopularTvSeries.path,
        child: (context) => const MostPopularTvSeriesPage());
    r.child(Routes.topRatedTvSeries.path,
        child: (context) => const TopRatedTvSeriesPage());
  }
}
