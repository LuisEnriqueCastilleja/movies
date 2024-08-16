import 'package:flutter/material.dart';
import 'package:movies/api/api_response.dart';
import 'package:movies/api/api_status.dart';
import 'package:movies/bloc/popular_tv_series_bloc.dart';
import 'package:movies/models/popular_tv_series/popular_tv_series_model.dart';
import 'package:movies/widgets/movie_card_title_and_image_widget.dart';

class PopularTvSeriesHomeList extends StatefulWidget {
  const PopularTvSeriesHomeList({super.key});

  @override
  State<PopularTvSeriesHomeList> createState() =>
      _PopularTvSeriesHomeListState();
}

class _PopularTvSeriesHomeListState extends State<PopularTvSeriesHomeList> {
  final PopularTvSeriesBloc _popularTvSeriesBloc = PopularTvSeriesBloc();
  List<PopularTvSeries> listOfPopularTvSeries = [];

  @override
  void initState() {
    _popularTvSeriesBloc.fetchPopularTvSeriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<List<PopularTvSeries>>>(
        stream: _popularTvSeriesBloc.popularTvSeriesListStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            switch (snapshot.data?.status) {
              case Status.loading:
                return const SizedBox();
              case Status.completed:
                listOfPopularTvSeries = snapshot.data!.data!;
                return (listOfPopularTvSeries.isEmpty)
                    ? const Center(
                        child: Text(
                          'No Popular TV Series.',
                        ),
                      )
                    : ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 10);
                        },
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: listOfPopularTvSeries.length,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 130.0,
                            child: CardMovieTitleAndImageWidget(
                              object: listOfPopularTvSeries[index],
                              onTap: () => {
                                //TODO: Navegar a los detalles de la pelicula
                              },
                            ),
                          );
                        });
              case Status.error:
                return const Text('Error Loading Popular TV Series.');
              case null:
                break;
            }
          }
          return Container();
        });
  }
}
