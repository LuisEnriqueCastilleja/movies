import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movies/helpers/extra_styles.dart';
import 'package:movies/helpers/style_movies.dart';
import 'package:movies/widgets/app_bars/appbar_back_arrow_widget.dart';

class SeriesPage extends StatefulWidget {
  const SeriesPage({super.key});

  @override
  State<SeriesPage> createState() => _SeriesPageState();
}

class _SeriesPageState extends State<SeriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarBackArrowWidget(
        title: 'Hi Luis',
        onPressedBack: () => Modular.to.pop(),
        onPressedNotifications: () => {},
        onPressedUser: () => {},
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ExtraStyles.boxHeight20,
          const Center(
              child: Text(
            'Series',
            style: StyleMovies.blackMedium20,
          )),
        ],
      ),
    );
  }
}
