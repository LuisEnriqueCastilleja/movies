import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/repositories/coming_soon_movies_repository.dart';

//TODO: Aqui dejo comentario de como funciona el BLoC que implemente, no me alcanzo el tiempo para comentar todos los BLoC pero funcionan de igual manera.
//BLoC para manejar cuando implemente un streamBuilder y hacer el get de mis listados
class ComingSoonMoviesBloc extends Disposable {
  //Repositorio para hacer mi GET
  ComingSoonMoviesRepository? _comingSoonMoviesRepository;
  //facilita la creación de un Stream y un Sink. Permite que se puedan emitir datos
  //hacia el Stream a través del Sink, y que los consumidores puedan escuchar esos datos a través del Stream.
  StreamController<ApiResponse<List<Movie>>>? _comingSoonMoviesListController;

//Este Sink es usado para enviar datos al Stream,
// lo que provoca que los StreamBuilders que escuchan ese Stream reaccionen a los nuevos datos.
  StreamSink<ApiResponse<List<Movie>>> get comingSoonMoviesListSink =>
      _comingSoonMoviesListController!.sink;

  //se usa principalmente para manejar la comunicación asíncrona entre la lógica de negocio
  // y la interfaz de usuario
  Stream<ApiResponse<List<Movie>>> get comingSoonMoviesListStream =>
      _comingSoonMoviesListController!.stream;

//Constructor para inicializar mi listado de aplicaciones
  ComingSoonMoviesBloc() {
    //Inicializamos mi streamController
    _comingSoonMoviesListController =
        StreamController<ApiResponse<List<Movie>>>();
    //Inicializamos nuestro repositorio
    _comingSoonMoviesRepository = Modular.get<ComingSoonMoviesRepository>();
  }

//Metodo para hacer el fetch y traernos el listado correspondiente
  Future fetchComingSoonMovies() async {
    //Para indicar al stream que estamos cargando los datos.
    comingSoonMoviesListSink
        .add(ApiResponse.loading('Fetching Coming Soon Movies.'));
    try {
      //Guardar en un listado lo que nos devuelva el repositorio.
      List<Movie>? comingSoonMoviesList =
          await _comingSoonMoviesRepository?.getComingSoonMoviesList();
      comingSoonMoviesListSink.add(ApiResponse.completed(comingSoonMoviesList));
      //Para capturar los errores cuando se traen los datos de la API
    } catch (e) {
      //Devolver que hay un error para que nuestro stream sepa que hay algun error.
      comingSoonMoviesListSink.add(ApiResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    _comingSoonMoviesListController?.close();
  }
}
