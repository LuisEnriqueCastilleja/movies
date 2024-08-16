import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/movies_tv_people_bloc.dart';
import 'package:movies/models/trending/trending_model.dart';
import 'package:movies/navigation/navigation.dart';
import 'package:movies/widgets/movie_card_title_and_image_widget.dart';

class OnTrendHomeList extends StatefulWidget {
  const OnTrendHomeList({super.key});

  @override
  State<OnTrendHomeList> createState() => _OnTrendHomeListState();
}

class _OnTrendHomeListState extends State<OnTrendHomeList> {
  final navigation = Modular.get<Navigation>();
  final MoviesTvPeopleBloc _moviesTvPeopleBloc = MoviesTvPeopleBloc();
  List<Trending> listOfTrending = [];

  @override
  void initState() {
    _moviesTvPeopleBloc.fetchMoviesTvPeopleList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<List<Trending>>>(
        stream: _moviesTvPeopleBloc.movieTvPeopleListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data?.status) {
              case Status.loading:
                return const SizedBox();
              case Status.completed:
                listOfTrending = snapshot.data!.data!;
                return (listOfTrending.isEmpty)
                    ? const Center(
                        child: Text(
                          'No Trending Movies or TV Shows.',
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listOfTrending.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 130.0,
                            child: CardMovieTitleAndImageWidget(
                              object: listOfTrending[index],
                              onTap: () => {
                                //TODO: Navegar a los detalles de la pelicula
                              },
                            ),
                          );
                        });
              case Status.error:
                return const Text('Error Loading Trending Movies, TV Shows.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
