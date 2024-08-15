import 'package:flutter/material.dart';
import 'package:movies/models/popular_tv_series/popular_tv_series_model.dart';
import 'package:movies/widgets/kind_of_movies_tv_people_card_widget.dart';

class ListOfMostPopularTvSeries extends StatefulWidget {
  final List<PopularTvSeries>? listOfPopularTvSeries;

  const ListOfMostPopularTvSeries({super.key, this.listOfPopularTvSeries});

  @override
  State<ListOfMostPopularTvSeries> createState() =>
      _ListOfMostPopularTvSeriesState();
}

class _ListOfMostPopularTvSeriesState extends State<ListOfMostPopularTvSeries> {
  @override
  Widget build(BuildContext context) {
    if (widget.listOfPopularTvSeries == null ||
        widget.listOfPopularTvSeries!.isEmpty) {
      return const Center(
        child: Text(
          'No most popular tv series available.',
        ),
      );
    } else {
      return Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Número de columnas
            crossAxisSpacing: 10.0, // Espacio horizontal entre los elementos
            mainAxisSpacing: 10.0, // Espacio vertical entre los elementos
            childAspectRatio:
                0.7, // Ajusta el aspecto (ancho:alto) de las tarjetas
          ),
          itemCount: widget.listOfPopularTvSeries!.length,
          itemBuilder: (context, index) {
            return KindOfMoviesTvPeopleCardWidget(
              object: widget.listOfPopularTvSeries![index],
            );
          },
        ),
      );
    }
  }
}
