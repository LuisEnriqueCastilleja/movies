import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';

class GreenButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const GreenButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          constraints: const BoxConstraints(
            minWidth: 200.0,
            maxHeight: 40.0,
          ),
          height: 40.0,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              backgroundColor: ColorsMovies.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onPressed: ()=> onTap(),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
