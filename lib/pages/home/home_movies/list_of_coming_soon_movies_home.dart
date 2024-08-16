import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/coming_soon_movies_bloc.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

class ListOfComingSoonMoviesHome extends StatefulWidget {
  const ListOfComingSoonMoviesHome({super.key});

  @override
  State<ListOfComingSoonMoviesHome> createState() =>
      _ListOfComingSoonMoviesHomeState();
}

class _ListOfComingSoonMoviesHomeState
    extends State<ListOfComingSoonMoviesHome> {
  final ComingSoonMoviesBloc _comingSoonMoviesBloc = ComingSoonMoviesBloc();
  List<Movie> listOfTrendingMovies = [];

  @override
  void initState() {
    _comingSoonMoviesBloc.fetchComingSoonMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<List<Movie>>>(
        stream: _comingSoonMoviesBloc.comingSoonMoviesListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data?.status) {
              case Status.loading:
                return const SizedBox();
              case Status.completed:
                listOfTrendingMovies = snapshot.data!.data!;
                return GridCardsWidget(
                  listOfObjects: listOfTrendingMovies,
                  titleNoAvailable: 'No coming soon movies available',
                );
              case Status.error:
                return const Text('Error Loading coming soon movies.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
