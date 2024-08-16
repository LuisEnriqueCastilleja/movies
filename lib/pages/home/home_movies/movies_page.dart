import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/pages/home/home_movies/list_of_coming_soon_movies_home.dart';
import 'package:movies/pages/home/home_movies/list_of_popular_movies_home.dart';
import 'package:movies/pages/home/home_movies/list_of_top_rated_movies_home.dart';
import 'package:movies/pages/home/home_movies/list_of_trending_movies_home.dart';
import 'package:movies/widgets/buttons_to_search_movies_widget.dart';
import 'package:movies/pages/home/home_movies/list_of_movies_filtered_home.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';
import 'package:movies/widgets/inputs/search_input.dart';

//Pagina de peliculas
class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final TextEditingController _searchController = TextEditingController();
  int selectedIndex = 5;

//Para decir que listado se va a dibujar dependiendo a que boton le de.
  Widget _getListWidget() {
    switch (selectedIndex) {
      case 0:
        return ListOfMoviesFilteredHome(search: _searchController.text.trim());
      case 1:
        return const ListOfPopularMoviesHome();
      case 2:
        return const ListOfTopRatedMoviesHome();
      case 3:
        return const ListOfTrendingMoviesHome();
      case 4:
        return const ListOfComingSoonMoviesHome();
      case 5:
        return const Text(
          'Select a filter o use the search to find movies.',
          style: StyleMovies.blackMedium14,
        );
      default:
        return Container();
    }
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
                const Center(
                    child: Text(
                  'Movies',
                  style: StyleMovies.blackMedium20,
                )),
                ExtraStyles.boxHeight20,
                SearchInput(
                  controller: _searchController,
                  onChanged: (text) => {},
                  onTapIconFilter: () => setState(() {
                    selectedIndex = 0;
                  }),
                ),
                ExtraStyles.boxHeight10,
                //Dependiendo que boton le de guardamos un index para dibujar el listado que se requiera
                ButtonsToSearchMoviesWidget(
                  onTapPopular: () => setState(() {
                    selectedIndex = 1;
                  }),
                  onTapTopRated: () => setState(() {
                    selectedIndex = 2;
                  }),
                  onTapTrending: () => {
                    setState(() {
                      selectedIndex = 3;
                    }),
                  },
                  onTapComingSoon: () => setState(() {
                    selectedIndex = 4;
                  }),
                ),
                ExtraStyles.boxHeight20,
                _getListWidget()
              ],
            ),
          ),
        ));
  }
}
