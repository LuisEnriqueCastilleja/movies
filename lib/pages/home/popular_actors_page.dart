import 'package:flutter/material.dart';

class PopularActorsPage extends StatefulWidget {
  const PopularActorsPage({super.key});

  @override
  State<PopularActorsPage> createState() => _PopularActorsPageState();
}

class _PopularActorsPageState extends State<PopularActorsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Text('Popular Actors'),
    ));
  }
}
