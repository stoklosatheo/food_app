import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});
  final primaryColor = const Color.fromRGBO(254, 183, 77, 1);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Color.fromRGBO(43, 48, 58, 1)),
      cursorColor: const Color.fromRGBO(43, 48, 58, 1),
      decoration: InputDecoration(
          hintText: 'Rechercher une recette',
          hintStyle: const TextStyle(color: Color.fromRGBO(43, 48, 58, 0.5)),
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            Icons.search_outlined,
            color: primaryColor,
          ),
          focusColor: primaryColor,
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: primaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              borderSide: BorderSide(color: primaryColor))),
    );
  }
}
