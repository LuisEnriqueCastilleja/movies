import 'package:flutter/material.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/widgets/buttons/text_button_widget.dart';

//Botones de popular, trending, top rated y coming soon
class ButtonsToSearchMoviesWidget extends StatelessWidget {
  final Function() onTapPopular;
  final Function() onTapTrending;
  final Function() onTapTopRated;
  final Function() onTapComingSoon;

  const ButtonsToSearchMoviesWidget(
      {super.key,
      required this.onTapPopular,
      required this.onTapTrending,
      required this.onTapTopRated,
      required this.onTapComingSoon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TextButtonWidget(title: 'Popular', onTap: () => onTapPopular()),
            ExtraStyles.boxWidth05,
            TextButtonWidget(title: 'Trending', onTap: () => onTapTrending()),
            ExtraStyles.boxWidth05,
            TextButtonWidget(title: 'Top Rated', onTap: () => onTapTopRated()),
            ExtraStyles.boxWidth05,
            TextButtonWidget(
                title: 'Coming soon', onTap: () => onTapComingSoon()),
          ],
        ));
  }
}
