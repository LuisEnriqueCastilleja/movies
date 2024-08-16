import 'package:flutter/material.dart';
import 'package:movies/helpers/colors_movies.dart';
import 'package:movies/helpers/font_awesome.dart';
import 'package:movies/helpers/style_movies.dart';

class SearchInput extends StatefulWidget {
  final TextEditingController controller;
  final Function(String text) onChanged;
  final Function(String text) onTapIconFilter;

  const SearchInput({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onTapIconFilter,
  });

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  final FocusNode _textFieldFocus = FocusNode();
  String search = '';
  Color _color = Colors.transparent;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = ColorsMovies.lightgrey;
        });
      } else {
        setState(() {
          _color = Colors.transparent;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: (value) => {
        search = value,
        widget.onChanged(value),
      },
      focusNode: _textFieldFocus,
      keyboardType: TextInputType.text,
      cursorColor: ColorsMovies.darkBlue,
      style: StyleMovies.blackMedium14,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(right: 10.0, bottom: 0, top: 0),
        errorStyle: const TextStyle(height: 0),
        enabled: true,
        fillColor: _color,
        filled: true,
        prefixIcon: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          icon: FontAwesome.darkBlueMagnifyingGlass20,
          onPressed: () => widget.onTapIconFilter(search),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsMovies.darkBlue, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(color: ColorsMovies.darkBlue, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
    );
  }
}
