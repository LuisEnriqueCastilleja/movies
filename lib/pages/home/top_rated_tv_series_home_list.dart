import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/top_rated_tv_series_bloc.dart';
import 'package:movies/models/top_rated_tv_series/top_rated_tv_series_model.dart';
import 'package:movies/widgets/movie_card_title_and_image_widget.dart';

class TopRatedTvSeriesHomeList extends StatefulWidget {
  const TopRatedTvSeriesHomeList({super.key});

  @override
  State<TopRatedTvSeriesHomeList> createState() =>
      _TopRatedTvSeriesHomeListState();
}

class _TopRatedTvSeriesHomeListState extends State<TopRatedTvSeriesHomeList> {
  final TopRatedTvSeriesBloc _topRatedTvSeriesBloc = TopRatedTvSeriesBloc();
  List<TopRatedTvSeries> listOfTopRatedTvSeries = [];

  @override
  void initState() {
    _topRatedTvSeriesBloc.fetchTopRatedTvSeriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<List<TopRatedTvSeries>>>(
        stream: _topRatedTvSeriesBloc.topRatedTvSeriesListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data?.status) {
              case Status.loading:
                return const SizedBox();
              case Status.completed:
                listOfTopRatedTvSeries = snapshot.data!.data!;
                return (listOfTopRatedTvSeries.isEmpty)
                    ? const Center(
                        child: Text(
                          'No Top Rated TV Series.',
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listOfTopRatedTvSeries.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 130.0,
                            child: CardMovieTitleAndImageWidget(
                              object: listOfTopRatedTvSeries[index],
                              onTap: () => {
                                //TODO: Navegar a los detalles de la pelicula
                              },
                            ),
                          );
                        });
              case Status.error:
                return const Text('Error Loading Top Rated TV Series.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
