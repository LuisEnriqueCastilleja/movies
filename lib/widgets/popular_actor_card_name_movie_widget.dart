import 'package:flutter/material.dart';
import 'package:movies/helpers/style_movies.dart';

//Tarjeta de actores
class PopularActorCardNameMovieWidget extends StatelessWidget {
  final dynamic object;
  const PopularActorCardNameMovieWidget({
    super.key,
    required this.object,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 3,
      child: Stack(
        children: [
          //Para establecer de fondo del actor o cualquier objeto que contenta las propiedades necesarias
          Positioned.fill(
            child: FadeInImage.assetNetwork(
              fadeInDuration: const Duration(milliseconds: 300),
              fit: BoxFit.cover,
              placeholder: 'assets/img/fondoGris.jpg',
              image:
                  'https://image.tmdb.org/t/p/original/${object.profilePath}',
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
                      '${object.name ?? object.originalName ?? ''}',
                      style: StyleMovies.whiteMedium12,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      //Verifica que el listado de Knowfor no sea nulo, si esta nulo devuelve vacio
                      //Si no es nulo verificamos que el original title del primer objeto del listado no sea nulo
                      //Si no es nulo devolvemos el original title y sino el title de la pelicula
                      '${(object.knownFor != null) ? (object.knownFor[0].originalTitle != null) ? object.knownFor[0].originalTitle : object.knownFor[0].title : ''}',
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
