import 'package:flutter/material.dart';

class MyListsPage extends StatefulWidget {
  const MyListsPage({super.key});

  @override
  State<MyListsPage> createState() => _MyListsPageState();
}

class _MyListsPageState extends State<MyListsPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('My Lists Page'),
    );
  }
}
