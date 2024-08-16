import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';

//Dialogo para mostrar cuando el estado que devuelve el BLoC es loading
class LoadingWidget extends StatelessWidget {
  final String loadingMessage;

  const LoadingWidget({super.key, required this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 150.0,
        width: 260.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsMovies.lightBlue,
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.16),
                spreadRadius: 0,
                blurRadius: 8.0,
                offset: Offset(2, 3)),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/gifs/loading.gif'),
              width: 50.0,
              height: 50.0,
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(loadingMessage),
            ),
          ],
        ),
      ),
    );
  }
}
