import 'package:flutter/material.dart';
import 'package:movies/models/trending/trending_model.dart';
import 'package:movies/widgets/kind_of_movies_tv_people_card_widget.dart';

class ListOfOnTrend extends StatefulWidget {
  final List<Trending>? listOfTrending;

  const ListOfOnTrend({super.key, this.listOfTrending});

  @override
  State<ListOfOnTrend> createState() => _ListOfOnTrendState();
}

class _ListOfOnTrendState extends State<ListOfOnTrend> {
  @override
  Widget build(BuildContext context) {
    if (widget.listOfTrending == null || widget.listOfTrending!.isEmpty) {
      return const Center(
        child: Text(
          'No movies or series available',
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
          itemCount: widget.listOfTrending!.length,
          itemBuilder: (context, index) {
            return KindOfMoviesTvPeopleCardWidget(
              object: widget.listOfTrending![index],
            );
          },
        ),
      );
    }
  }
}
