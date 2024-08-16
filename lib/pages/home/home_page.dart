import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/pages/home/popular_tv_series_home_list.dart';
import 'package:movies/pages/home/popular_movies_home_list.dart';
import 'package:movies/widgets/movies_series_popular_actor_buttons_widget.dart';
import 'package:movies/pages/home/on_trend_home_list.dart';
import 'package:movies/pages/home/top_rated_tv_series_home_list.dart';
import 'package:movies/widgets/title_and_icon_widget.dart';

//El HomePage que contiene 4 listado de peliculas
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final navigation = Modular.get<Navigation>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          //Listado con las peliculas populares
          const SizedBox(height: 200.0, child: PopularMoviesHomeList()),
          ExtraStyles.boxHeight20,
          //Botones de Movies, series, popular actors
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: MoviesSeriesPopularActorButtonsWidget(),
          ),
          ExtraStyles.boxHeight10,
          //Cuando le de al icono de On Trend hacemos que navegue a la pagina para ver las peliculas, TV Series, actors on trend
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TitleAndIconWidget(
              title: 'On trend',
              onTap: () => navigation.goToOnTrendPage(),
            ),
          ),
          ExtraStyles.boxHeight05,
          //Listado en mi home page con las tv series on trend
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(height: 200.0, child: OnTrendHomeList()),
          ),
          ExtraStyles.boxHeight10,
          //Cuando le de al icono de most popular tv series hacemos que navegue a la pagina para ver las TV Series mas populares
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TitleAndIconWidget(
              title: 'Most popular tv series',
              onTap: () => navigation.goToMostPopularTvSeriesPage(),
            ),
          ),
          //Listado con las tv series mas populares
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(height: 200.0, child: PopularTvSeriesHomeList()),
          ),
          ExtraStyles.boxHeight10,
          //Cuando le de al icono de top rated tv series hacemos que navegue a la pagina para ver las TV Series on trend
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: TitleAndIconWidget(
              title: 'Top rated tv series',
              onTap: () => navigation.goToTopRatedTvSeriesPage(),
            ),
          ),
          //Listado con las tv series mejores calificadas
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(height: 200.0, child: TopRatedTvSeriesHomeList()),
          ),
          ExtraStyles.boxHeight20,
        ],
      ),
    );
  }
}
