import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/top_rated_movies_bloc.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

class ListOfTopRatedMoviesHome extends StatefulWidget {
  const ListOfTopRatedMoviesHome({super.key});

  @override
  State<ListOfTopRatedMoviesHome> createState() =>
      _ListOfTopRatedMoviesHomeState();
}

class _ListOfTopRatedMoviesHomeState extends State<ListOfTopRatedMoviesHome> {
  final TopRatedMoviesBloc _topRatedMoviesBloc = TopRatedMoviesBloc();
  List<Movie> listOfTopRatedMovies = [];

  @override
  void initState() {
    _topRatedMoviesBloc.fetchTopRatedMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<List<Movie>>>(
        stream: _topRatedMoviesBloc.topRatedMoviesListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data?.status) {
              case Status.loading:
                return const SizedBox();
              case Status.completed:
                listOfTopRatedMovies = snapshot.data!.data!;
                return GridCardsWidget(
                  listOfObjects: listOfTopRatedMovies,
                  titleNoAvailable: 'No top rated movies available',
                );
              case Status.error:
                return const Text('Error Loading top rated movies.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
