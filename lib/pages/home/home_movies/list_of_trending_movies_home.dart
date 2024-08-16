import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/trending_movies_bloc.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

class ListOfTrendingMoviesHome extends StatefulWidget {
  const ListOfTrendingMoviesHome({super.key});

  @override
  State<ListOfTrendingMoviesHome> createState() =>
      _ListOfTrendingMoviesHomeState();
}

class _ListOfTrendingMoviesHomeState extends State<ListOfTrendingMoviesHome> {
  final TrendingMoviesBloc _trendingMoviesBloc = TrendingMoviesBloc();
  List<Movie> listOfTrendingMovies = [];

  @override
  void initState() {
    _trendingMoviesBloc.fetchTrendingMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<List<Movie>>>(
        stream: _trendingMoviesBloc.trendingMoviesListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data?.status) {
              case Status.loading:
                return const SizedBox();
              case Status.completed:
                listOfTrendingMovies = snapshot.data!.data!;
                return GridCardsWidget(
                  listOfObjects: listOfTrendingMovies,
                  titleNoAvailable: 'No trending movies available',
                );
              case Status.error:
                return const Text('Error Loading trending movies.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
