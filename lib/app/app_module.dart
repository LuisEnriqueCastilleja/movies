import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/navigation/routes.dart';
import 'package:movies/pages/home/most_popular_tv_series/most_popular_tv_series_page.dart';
import 'package:movies/pages/home/home_movies/movies_page.dart';
import 'package:movies/pages/home/on_trend/on_trend_page.dart';
import 'package:movies/pages/home/popular_actors_page.dart';
import 'package:movies/pages/home/home_series/series_page.dart';
import 'package:movies/pages/home/top_rated_tv_series/top_rated_tv_series_page.dart';
import 'package:movies/pages/login/login_page.dart';
import 'package:movies/pages/main/main_page.dart';
import 'package:movies/pages/kind_of_movies_tv_people_do_you_like/kind_of_movies_tv_people_page.dart';
import 'package:movies/repositories/coming_soon_movies_repository.dart';
import 'package:movies/repositories/popular_actors_repository.dart';
import 'package:movies/repositories/popular_movies_respository.dart';
import 'package:movies/repositories/popular_tv_series_repository.dart';
import 'package:movies/repositories/movies_tv_people_repository.dart';
import 'package:movies/repositories/search_movie_repository.dart';
import 'package:movies/repositories/top_rated_movies_repository.dart';
import 'package:movies/repositories/top_rated_tv_series_repository.dart';
import 'package:movies/repositories/trending_movies_repository.dart';

//App Module donde se hace la inyeccion de repositorios
class AppModule extends Module {
  //Inyenccion de repositorios que utilizo en mi aplicacion
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
    i.addLazySingleton<TrendingMoviesRepository>(
        () => TrendingMoviesRepository());
    i.addLazySingleton<TopRatedMoviesRepository>(
        () => TopRatedMoviesRepository());
    i.addLazySingleton<ComingSoonMoviesRepository>(
        () => ComingSoonMoviesRepository());
    i.addLazySingleton<PopularActorsRepository>(
        () => PopularActorsRepository());
  }

//Manejo del routeo de mi aplicacion
  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
    //Aqui decimos que pagina se dibujara cuando se navega a la ruta,
    //Aqui se pueden pasar los parametros en caso de que cuando hagamos navegaciones y requeramos
    //Que se pasen datos de pagina en pagina.
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
