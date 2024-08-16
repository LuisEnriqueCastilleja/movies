import 'package:flutter/material.dart';
import 'package:movies/helpers/style_movies.dart';

//Tarjeta de pelicula o tv series con imagen y texto debajo
class CardMovieTitleAndImageWidget extends StatelessWidget {
  final dynamic object;
  final Function() onTap;

  const CardMovieTitleAndImageWidget(
      {super.key, required this.object, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: FadeInImage.assetNetwork(
              fadeInDuration: const Duration(milliseconds: 300),
              fit: BoxFit.cover,
              placeholder: 'assets/img/fondoGris.jpg',
              image:
                  'https://image.tmdb.org/t/p/original/${object.backdropPath}',
            ),
          ),
          Text(
            object.originalTitle ?? object.originalName ?? '',
            style: StyleMovies.blackMedium14,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
