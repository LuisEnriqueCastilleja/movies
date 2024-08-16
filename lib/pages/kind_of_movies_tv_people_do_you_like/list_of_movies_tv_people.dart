import 'package:flutter/material.dart';
import 'package:movies/models/trending/trending_model.dart';
import 'package:movies/widgets/kind_of_movies_tv_people_card_widget.dart';

class ListOfMoviesTvPeople extends StatefulWidget {
  final List<Trending>? listOfTrending;

  const ListOfMoviesTvPeople({super.key, this.listOfTrending});

  @override
  State<ListOfMoviesTvPeople> createState() => _ListOfMoviesTvPeopleState();
}

class _ListOfMoviesTvPeopleState extends State<ListOfMoviesTvPeople> {
  // Lista para almacenar los índices de los elementos seleccionados
  final List<int> _selectedItems = [];

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
            // Número de columnas
            crossAxisCount: 3,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            // Ajusta el aspecto (ancho:alto) de las tarjetas
            childAspectRatio: 0.7,
          ),
          itemCount: widget.listOfTrending!.length,
          itemBuilder: (context, index) {
            bool isSelected = _selectedItems.contains(index);

            //Para detectar cuando hacen tap sobre la tarjeta de la pelicula
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (isSelected) {
                    //Si ya estaba selecccionado lo removemos de la lista
                    _selectedItems.remove(index);
                  } else if (_selectedItems.length < 5) {
                    //Si no estaba seleccionado y habia menos de 5 items seleccionados lo agregamos a la lista
                    _selectedItems.add(index);
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  //SI esta seleccionado agregamos un borde para que se diferencie de los demas
                  border: isSelected
                      ? Border.all(
                          color: Colors.blue,
                          width: 5.0,
                        )
                      : Border.all(width: 0.0),
                ),
                //Widget para el diseño de la tarjeta de las peliculas
                child: KindOfMoviesTvPeopleCardWidget(
                  object: widget.listOfTrending![index],
                ),
              ),
            );
          },
        ),
      );
    }
  }
}
