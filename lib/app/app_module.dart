import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_helper.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/navigation/routes.dart';
import 'package:movies/pages/movies/kind_of_movies_tv_people_page.dart';
import 'package:movies/repositories/movies_tv_people_repository.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<Navigation>(
      () => Navigation(),
    );
    i.addLazySingleton<ApiBaseHelper>(
      () => ApiBaseHelper(),
    );
    i.addLazySingleton<MoviesTvPeopleRepository>(
      () => MoviesTvPeopleRepository(),
    );
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const KindOfMoviesTvPeoplePage());
    r.child(Routes.kindOfMoviesTvPeople.path,
        child: (context) => const KindOfMoviesTvPeoplePage());
  }
}
