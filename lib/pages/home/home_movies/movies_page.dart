import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/bloc/movies_bloc.dart';
import 'package:movies/bloc/popular_movies_bloc.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/pages/home/buttons_to_search_movies.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';
import 'package:movies/widgets/inputs/search_input.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  final TextEditingController _searchController = TextEditingController();
  final PopularMoviesBloc _popularMoviesBloc = PopularMoviesBloc();
  final SearchMoviesBloc _searchMoviesBloc = SearchMoviesBloc();
  String search = '';
  bool showPopularMovies = false;
  bool showTopRatedMovies = false;
  bool showTrendingMovies = false;
  bool showComingSoonMovies = false;

  @override
  void initState() {
    _popularMoviesBloc.fetchPopularMovies();
    super.initState();
  }

  void loadList() {
    _searchMoviesBloc.fetchSearchedMovies(search);
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
        body: Padding(
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
                onChanged: (String search) {
                  search = search;
                },
                onTapIconFilter: (String search) {
                  search = search;
                  loadList();
                },
              ),
              ExtraStyles.boxHeight10,
              ButtonsToSearchMovies(
                onTapPopular: () => setState(() {
                  showPopularMovies = true;
                  showTopRatedMovies = false;
                  showTrendingMovies = false;
                  showComingSoonMovies = false;
                }),
                onTapTopRated: () => setState(() {
                  showPopularMovies = false;
                  showTopRatedMovies = true;
                  showTrendingMovies = false;
                  showComingSoonMovies = false;
                }),
                onTapTrending: () => {
                  setState(() {
                    showPopularMovies = false;
                    showTopRatedMovies = false;
                    showTrendingMovies = true;
                    showComingSoonMovies = false;
                  }),
                },
                onTapComingSoon: () => setState(() {
                  showPopularMovies = false;
                  showTopRatedMovies = false;
                  showTrendingMovies = false;
                  showComingSoonMovies = true;
                }),
              ),
              ExtraStyles.boxHeight20,
              //TODO: ADD LIST OF MOVIES
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
        ));
  }
}
