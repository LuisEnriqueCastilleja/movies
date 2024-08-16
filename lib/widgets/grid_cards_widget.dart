import 'package:flutter/material.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/widgets/movie_card_title_rating_widget.dart';
import 'package:movies/widgets/popular_actor_card_name_movie_widget.dart';

class GridCardsWidget extends StatelessWidget {
  final List<dynamic>? listOfObjects;
  final String titleNoAvailable;
  final bool isPopularActors;

  const GridCardsWidget(
      {super.key,
      this.listOfObjects,
      required this.titleNoAvailable,
      this.isPopularActors = false});

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
          // Número de columnas
          crossAxisCount: 3,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          // Ajusta el aspecto (ancho:alto) de las tarjeta
          childAspectRatio: 0.7,
        ),
        //Listado de objetos con informacion
        itemCount: listOfObjects!.length,
        //En el builder construimos el widget MovieCardTitleRatingWidget que pide un objeto
        itemBuilder: (context, index) {
          return (isPopularActors)
              ? PopularActorCardNameMovieWidget(
                  object: listOfObjects![index],
                )
              : MovieCardTitleRatingWidget(
                  object: listOfObjects![index],
                );
        },
      );
    }
  }
}
