import 'package:flutter/material.dart';
import 'package:movies/models/top_rated_tv_series/top_rated_tv_series_model.dart';
import 'package:movies/widgets/kind_of_movies_tv_people_card_widget.dart';

class ListOfTopRatedTvSeries extends StatefulWidget {
  final List<TopRatedTvSeries>? listOfTopRatedTvSeries;

  const ListOfTopRatedTvSeries({super.key, this.listOfTopRatedTvSeries});

  @override
  State<ListOfTopRatedTvSeries> createState() => _ListOfTopRatedTvSeriesState();
}

class _ListOfTopRatedTvSeriesState extends State<ListOfTopRatedTvSeries> {
  @override
  Widget build(BuildContext context) {
    if (widget.listOfTopRatedTvSeries == null ||
        widget.listOfTopRatedTvSeries!.isEmpty) {
      return const Center(
        child: Text(
          'No top rated tv series available.',
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
          itemCount: widget.listOfTopRatedTvSeries!.length,
          itemBuilder: (context, index) {
            return KindOfMoviesTvPeopleCardWidget(
              object: widget.listOfTopRatedTvSeries![index],
            );
          },
        ),
      );
    }
  }
}
