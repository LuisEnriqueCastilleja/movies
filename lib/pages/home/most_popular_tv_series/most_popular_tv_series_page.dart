import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/popular_tv_series_bloc.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/models/popular_tv_series/popular_tv_series_model.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';
import 'package:movies/widgets/dialogs/error_message_widget.dart';
import 'package:movies/widgets/dialogs/loading_dialog_widget.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

//TODO: Aqui explico como funciona la pagina most popular tv series, on trend y top rated tv series, ya que son iguales solo que traen diferentes datos y los BLoC cambian
class MostPopularTvSeriesPage extends StatefulWidget {
  const MostPopularTvSeriesPage({super.key});

  @override
  State<MostPopularTvSeriesPage> createState() =>
      _MostPopularTvSeriesPageState();
}

class _MostPopularTvSeriesPageState extends State<MostPopularTvSeriesPage> {
  //Instanciamos nuestro BLoC
  final PopularTvSeriesBloc _popularTvSeriesBloc = PopularTvSeriesBloc();
  //Listado para guardar los datos
  List<PopularTvSeries> listOfPopularTvSeries = [];

  @override
  void initState() {
    //Utlizamos el metodo fetch del BLoC para traernos los datos
    _popularTvSeriesBloc.fetchPopularTvSeriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarBackArrowWidget(
          title: 'Hi Luis',
          onPressedBack: () => Modular.to.pop(),
          onPressedNotifications: () => {},
          onPressedUser: () => {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                ExtraStyles.boxHeight20,
                const Text(
                  'Most populart tv series',
                  style: StyleMovies.blackMedium20,
                ),
                ExtraStyles.boxHeight20,
                //StreamBuilder para manejar la informacion
                StreamBuilder<ApiResponse<List<PopularTvSeries>>>(
                  //El stream es el que esta escuchando los cambios en los datos
                  stream: _popularTvSeriesBloc.popularTvSeriesListStream,
                  builder: (context, snapshot) {
                    //Si nuestro snapshot tiene data
                    if (snapshot.hasData) {
                      //Checamos el estado que nos devuelve el BLoC
                      switch (snapshot.data?.status) {
                        //SI esta cargando mostramos un dialogo de cargando
                        case Status.loading:
                          return const LoadingWidget(
                              loadingMessage: 'Loading on trend movies');
                        //SI se completa todo correctamente y no hay problemas con la peticion
                        case Status.completed:
                          //Guardamos la info en un listado para que sea mas claro
                          listOfPopularTvSeries = snapshot.data!.data!;
                          //Enviamos el listado y un titulo en caso de que no haya ningun dato
                          return GridCardsWidget(
                            titleNoAvailable:
                                'No most popular tv series available.',
                            listOfObjects: listOfPopularTvSeries,
                          );
                        //Cuando nuestro BLoC nos devuelve un estado de error
                        case Status.error:
                          //Mostramos un dialogo con un boton de retry para reintentar la peticion y traer los datos
                          return ErrorMessageWidget(
                              errorMessage:
                                  'Error Loading most popular tv series',
                              onRetryPressed: () => _popularTvSeriesBloc
                                  .fetchPopularTvSeriesList());
                        case null:
                          break;
                      }
                    }
                    return Container();
                  },
                ),
                ExtraStyles.boxHeight20,
              ],
            ),
          ),
        ));
  }
}
