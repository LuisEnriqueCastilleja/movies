import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/coming_soon_movies_bloc.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

//TODO: Aqui explico los listados que utilizo en movies page, son iguales solo cambia el BLoC porque traen diferentes datos.

//Listado con las proximas peliculas
class ListOfComingSoonMoviesHome extends StatefulWidget {
  const ListOfComingSoonMoviesHome({super.key});

  @override
  State<ListOfComingSoonMoviesHome> createState() =>
      _ListOfComingSoonMoviesHomeState();
}

class _ListOfComingSoonMoviesHomeState
    extends State<ListOfComingSoonMoviesHome> {
  //Instanciamos nuestro BLoC
  final ComingSoonMoviesBloc _comingSoonMoviesBloc = ComingSoonMoviesBloc();
  List<Movie> listOfTrendingMovies = [];

  @override
  void initState() {
    //Peticion a mi BLoC para que cuando se dibuje la aplicacion se haga la petición
    _comingSoonMoviesBloc.fetchComingSoonMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Builder para manejar los datos de nuestro BLoC
    return StreamBuilder<ApiResponse<List<Movie>>>(
        stream: _comingSoonMoviesBloc.comingSoonMoviesListStream,
        builder: (context, snapshot) {
          //Si tiene data nuestro snapshot
          if (snapshot.hasData) {
            //Checamos el status que nos devuelve el BLoC
            switch (snapshot.data?.status) {
              //Si esta cargando podemos mostrar aqui algun dialogo de cargando o un mensaje
              case Status.loading:
                return const SizedBox();
              //Cuando se completa la peticion y ya tenemos los datos
              case Status.completed:
                //Guardamos en un listado nuestros datos nada mas para que sea mas claro
                listOfTrendingMovies = snapshot.data!.data!;
                //Pasamos el listado con nuestros datos y un mensaje en caso de que el listado este vacio
                return GridCardsWidget(
                  listOfObjects: listOfTrendingMovies,
                  titleNoAvailable: 'No coming soon movies available',
                );
              //SI nuestro BLoC nos devuelve un error entra por aqui
              case Status.error:
                //Aqui mostramos el error, tambien podemos agregar un boton para volver a hacer el Fecth
                //Incluso un dialogo con un boton de reintentar.
                return const Text('Error Loading coming soon movies.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
