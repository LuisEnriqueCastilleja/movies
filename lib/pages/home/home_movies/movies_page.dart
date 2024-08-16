import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/pages/home/buttons_to_search_movies.dart';
import 'package:movies/pages/home/home_movies/list_of_movies_filtered_home.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';
import 'package:movies/widgets/inputs/search_input.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final TextEditingController _searchController = TextEditingController();
  bool showPopularMovies = false;
  bool showTopRatedMovies = false;
  bool showTrendingMovies = false;
  bool showComingSoonMovies = false;
  bool showMoviesFiltered = false;

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
                  onTapIconFilter: (String search) => setState(() {
                    showPopularMovies = false;
                    showTopRatedMovies = false;
                    showTrendingMovies = false;
                    showComingSoonMovies = false;
                    showMoviesFiltered = true;
                  }),
                ),
                ExtraStyles.boxHeight10,
                ButtonsToSearchMovies(
                  onTapPopular: () => setState(() {
                    showPopularMovies = true;
                    showTopRatedMovies = false;
                    showTrendingMovies = false;
                    showComingSoonMovies = false;
                    showMoviesFiltered = false;
                  }),
                  onTapTopRated: () => setState(() {
                    showPopularMovies = false;
                    showTopRatedMovies = true;
                    showTrendingMovies = false;
                    showComingSoonMovies = false;
                    showMoviesFiltered = false;
                  }),
                  onTapTrending: () => {
                    setState(() {
                      showPopularMovies = false;
                      showTopRatedMovies = false;
                      showTrendingMovies = true;
                      showComingSoonMovies = false;
                      showMoviesFiltered = false;
                    }),
                  },
                  onTapComingSoon: () => setState(() {
                    showPopularMovies = false;
                    showTopRatedMovies = false;
                    showTrendingMovies = false;
                    showComingSoonMovies = true;
                    showMoviesFiltered = false;
                  }),
                ),
                ExtraStyles.boxHeight20,
                //TODO: ADD LIST OF MOVIES
                Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: showMoviesFiltered,
                    child: ListOfMoviesFilteredHome(
                      isVisible: showMoviesFiltered,
                      search: _searchController.text.trim(),
                    )),
                Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: showPopularMovies,
                    child: Container()),
                Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: showTopRatedMovies,
                    child: Container()),
                Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: showTrendingMovies,
                    child: Container()),
                Visibility(
                    maintainSize: false,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: showComingSoonMovies,
                    child: Container()),
              ],
            ),
          ),
        ));
  }
}
