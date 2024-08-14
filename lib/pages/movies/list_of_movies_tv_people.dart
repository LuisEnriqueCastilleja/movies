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
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Número de columnas
            crossAxisSpacing: 10.0, // Espacio horizontal entre los elementos
            mainAxisSpacing: 10.0, // Espacio vertical entre los elementos
          ),
          itemCount: widget.listOfTrending!.length,
          itemBuilder: (context, index) {
            return KindOfMoviesTvPeopleCardWidget(
              trending: widget.listOfTrending![index],
            );
          },
        ),
      );
    }
  }
}
