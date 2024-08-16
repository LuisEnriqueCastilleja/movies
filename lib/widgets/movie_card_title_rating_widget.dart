import 'package:flutter/material.dart';
import 'package:movies/helpers/style_movies.dart';

//Tarjeta de peliculas, tv series con imagen y el rating
class MovieCardTitleRatingWidget extends StatelessWidget {
  final dynamic object;
  const MovieCardTitleRatingWidget({
    super.key,
    required this.object,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 3,
      child: Stack(
        children: [
          //Para establecer de fondo la imagen de la pelicula o tv serie o cualquier objeto que contenta las propiedades
          Positioned.fill(
            child: FadeInImage.assetNetwork(
              fadeInDuration: const Duration(milliseconds: 300),
              fit: BoxFit.cover,
              placeholder: 'assets/img/fondoGris.jpg',
              image:
                  'https://image.tmdb.org/t/p/original/${object.backdropPath ?? object.posterPath}',
            ),
          ),
          //Para poner sobre la imagen el titulo y el rating de la pelicula o tv serie o cualquier objeto que contenga las propiedades necesarias
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${object.originalTitle ?? object.originalName ?? ''}',
                      style: StyleMovies.whiteMedium12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${object.voteAverage}',
                      style: StyleMovies.whiteMedium12,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
