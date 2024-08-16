import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/popular_movies_bloc.dart';
import 'package:movies/models/popular_movies/popular_movies_model.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

class ListOfPopularMoviesHome extends StatefulWidget {
  const ListOfPopularMoviesHome({super.key});

  @override
  State<ListOfPopularMoviesHome> createState() =>
      _ListOfPopularMoviesHomeState();
}

class _ListOfPopularMoviesHomeState extends State<ListOfPopularMoviesHome> {
  final PopularMoviesBloc _popularMoviesBloc = PopularMoviesBloc();
  List<PopularMovies> listOfPopularMovies = [];

  @override
  void initState() {
    _popularMoviesBloc.fetchPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<List<PopularMovies>>>(
        stream: _popularMoviesBloc.popularMoviesListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data?.status) {
              case Status.loading:
                return const SizedBox();
              case Status.completed:
                listOfPopularMovies = snapshot.data!.data!;
                return GridCardsWidget(
                  listOfObjects: listOfPopularMovies,
                  titleNoAvailable: 'No popular movies available',
                );
              case Status.error:
                return const Text('Error Loading popular movies.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
