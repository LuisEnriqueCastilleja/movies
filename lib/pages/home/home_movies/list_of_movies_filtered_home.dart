import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/movies_bloc.dart';
import 'package:movies/models/movie/movie_model.dart';
import 'package:movies/widgets/grid_cards_widget.dart';

class ListOfMoviesFilteredHome extends StatefulWidget {
  final String search;
  final bool isVisible;
  const ListOfMoviesFilteredHome(
      {super.key, required this.search, required this.isVisible});

  @override
  State<ListOfMoviesFilteredHome> createState() =>
      _ListOfMoviesFilteredHomeState();
}

class _ListOfMoviesFilteredHomeState extends State<ListOfMoviesFilteredHome> {
  final SearchMoviesBloc _searchMoviesBloc = SearchMoviesBloc();
  List<Movie> listOfMoviesFiltered = [];

  @override
  void didUpdateWidget(ListOfMoviesFilteredHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isVisible && oldWidget.search != widget.search) {
      _searchMoviesBloc.fetchSearchedMovies(widget.search);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<List<Movie>>>(
        stream: _searchMoviesBloc.searchMoviesListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data?.status) {
              case Status.loading:
                return const SizedBox();
              case Status.completed:
                listOfMoviesFiltered = snapshot.data!.data!;
                return GridCardsWidget(
                  listOfObjects: listOfMoviesFiltered,
                  titleNoAvailable: 'No movies available',
                );
              case Status.error:
                return const Text('Error Loading Movies.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
