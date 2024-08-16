import 'package:flutter/material.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/widgets/movie_card_title_rating_widget.dart';

class GridCardsWidget extends StatelessWidget {
  final List<dynamic>? listOfObjects;
  final String titleNoAvailable;

  const GridCardsWidget(
      {super.key, this.listOfObjects, required this.titleNoAvailable});

  @override
  Widget build(BuildContext context) {
    if (listOfObjects == null || listOfObjects!.isEmpty) {
      return Center(
        child: Text(
          titleNoAvailable,
          style: StyleMovies.blackMedium14,
        ),
      );
    } else {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Número de columnas
          crossAxisSpacing: 10.0, // Espacio horizontal entre los elementos
          mainAxisSpacing: 10.0, // Espacio vertical entre los elementos
          childAspectRatio:
              0.7, // Ajusta el aspecto (ancho:alto) de las tarjetas
        ),
        itemCount: listOfObjects!.length,
        itemBuilder: (context, index) {
          return MovieCardTitleRatingWidget(
            object: listOfObjects![index],
          );
        },
      );
    }
  }
}
