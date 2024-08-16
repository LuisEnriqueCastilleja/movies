import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/font_awesome.dart';
import 'package:movies/widgets/buttons/grey_button_widget.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;
  final Function() onRetryPressed;

  const ErrorMessageWidget(
      {super.key, required this.errorMessage, required this.onRetryPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 230.0,
        width: 260.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorsMovies.darkGrey,
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
            FontAwesome.cianAlert40,
            ExtraStyles.boxHeight10,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(errorMessage),
            ),
            ExtraStyles.boxHeight20,
            GreyButtonWidget(title: 'Retry', onTap: () => onRetryPressed())
          ],
        ),
      ),
    );
  }
}
