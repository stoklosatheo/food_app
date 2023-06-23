import 'package:flutter/material.dart';
import 'package:food_app/models/recipes_data.dart' as RecipeData;
import 'package:food_app/models/utils.dart';
import 'package:food_app/pages/recipe/widgets/step.dart' as RecipeStep;

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
                const SizedBox(
                  height: 20,
                ),
                Subtitle(recipe.description!),
                const SizedBox(
                  height: 20,
                ),
                if (recipe.servings <= 8)
                  Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                    for (var i = 0; i < recipe.servings; i++)
                      const Icon(
                        Icons.local_pizza_outlined,
                        color: primaryColor,
                        size: 30,
                      ),
                  ])
                else
                  Row(children: [
                    const Icon(
                      Icons.local_pizza_outlined,
                      color: primaryColor,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${recipe.servings} servings')
                  ]),
                const SizedBox(
                  height: 20,
                ),
                if (recipe.prepTime != null && recipe.prepTime != 0)
                  Row(
                    children: [
                      const Icon(
                        Icons.local_dining_outlined,
                        color: primaryColor,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text('${recipe.prepTime} minutes')
                    ],
                  ),
                const SizedBox(height: 20),
                if (recipe.cookingTime != null && recipe.cookingTime != 0)
                  Row(children: [
                    const Icon(
                      Icons.outdoor_grill,
                      color: primaryColor,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text('${recipe.cookingTime} minutes')
                  ]),
                Column(
                  // TODO : récupérer les étapes d'une recette en faisant une classe Steps dans la data
                  children: [
                    // for (var i = 0; i < recipe.)
                    RecipeStep.Step('1', 'oui'),
                  ],
                )
              ]))
        ],
      ),
    );
  }
}
