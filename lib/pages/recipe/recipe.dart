import 'package:flutter/material.dart';
import 'package:food_app/models/recipes_data.dart' as RecipeData;
import 'package:food_app/models/utils.dart';

class Recipe extends StatelessWidget {
  const Recipe(this.recipe, {super.key});
  static const primaryColor = Color.fromRGBO(254, 183, 77, 1);
  final RecipeData.Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top,
                  left: 20,
                  bottom: 20),
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: primaryColor,
                  ))),
          SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: NetworkImage(recipe.thumbnail),
                fit: BoxFit.cover,
              )),
          Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                H1(recipe.name),
                Subtitle(recipe.description!),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.person,
                      color: primaryColor,
                      size: 30,
                    ),
                  ],
                )
              ]))
        ],
      ),
    );
  }
}
