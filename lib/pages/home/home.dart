import 'package:flutter/material.dart';
import 'package:food_app/pages/home/widgets/recipes_list.dart';
import 'package:food_app/pages/home/widgets/search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(children: const [
              SearchBar(),
              SizedBox(
                height: 20,
              ),
              RecipesList()
            ])));
  }
}
