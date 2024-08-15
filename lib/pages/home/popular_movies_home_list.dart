import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/popular_movies_bloc.dart';
import 'package:movies/models/popular_movies/popular_movies_model.dart';
import 'package:movies/widgets/kind_of_movies_tv_people_card_widget.dart';

class PopularMoviesHomeList extends StatefulWidget {
  const PopularMoviesHomeList({super.key});

  @override
  State<PopularMoviesHomeList> createState() => _PopularMoviesHomeListState();
}

class _PopularMoviesHomeListState extends State<PopularMoviesHomeList> {
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
              return (listOfPopularMovies.isEmpty)
                  ? const Center(
                      child: Text(
                        'No Popular Movies.',
                      ),
                    )
                  : ListView.separated(
                      separatorBuilder: (context, index) {
                        return const SizedBox(width: 10);
                      },
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: listOfPopularMovies.length,
                      itemBuilder: (context, index) {
                        return KindOfMoviesTvPeopleCardWidget(
                          object: listOfPopularMovies[index],
                        );
                      });
            case Status.error:
              return const Text('Error Loading Popular Movies.');
            case null:
              break;
          }
        }
        return Container();
      },
    );
  }
}
