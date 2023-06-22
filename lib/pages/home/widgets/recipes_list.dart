import 'package:flutter/material.dart';
import 'package:food_app/models/recipes_data.dart';
import 'package:food_app/pages/recipe/recipe.dart' as RecipeDetail;

class RecipesList extends StatefulWidget {
  const RecipesList({super.key});

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {
  late Future<RecipeList> futureRecipe;

  List<Color> tagColors = [
    const Color.fromRGBO(244, 68, 55, 0.8),
    const Color.fromRGBO(101, 181, 244, 0.8),
    const Color.fromRGBO(78, 209, 226, 0.8),
    const Color.fromRGBO(245, 143, 109, 0.8),
    const Color.fromRGBO(253, 103, 129, 0.8),
  ];

  @override
  void initState() {
    super.initState();
    futureRecipe = fetchRecipeList();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      FutureBuilder<RecipeList>(
        future: futureRecipe,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SizedBox(
                height: 600,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => RecipeDetail.Recipe(
                                      snapshot.data!.recipes[index]))),
                          child: Card(
                              elevation: 3,
                              child: Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                          opacity: 0.8,
                                          fit: BoxFit.cover,
                                          image: NetworkImage(snapshot.data!
                                              .recipes[index].thumbnail))),
                                  child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                              snapshot.data!.recipes[index].name
                                                  .toUpperCase()),
                                          Wrap(
                                            spacing: 10,
                                            runSpacing: 5,
                                            children: [
                                              if (snapshot.data!.recipes[index]
                                                      .tags!.length >
                                                  3)
                                                for (var i = 0; i < 3; i++)
                                                  Container(
                                                      color: tagColors[i],
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      5),
                                                          child: Text(
                                                              snapshot
                                                                  .data!
                                                                  .recipes[
                                                                      index]
                                                                  .tags![i]
                                                                  .displayName
                                                                  .toUpperCase(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white))))
                                              else
                                                for (var i = 0;
                                                    i <
                                                        snapshot
                                                            .data!
                                                            .recipes[index]
                                                            .tags!
                                                            .length;
                                                    i++)
                                                  Container(
                                                      color: tagColors[i],
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 5,
                                                                  horizontal:
                                                                      5),
                                                          child: Text(
                                                              snapshot
                                                                  .data!
                                                                  .recipes[
                                                                      index]
                                                                  .tags![i]
                                                                  .displayName
                                                                  .toUpperCase(),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white))))
                                            ],
                                          )
                                        ],
                                      )))));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    itemCount: snapshot.data!.recipes.length));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    ]));
  }
}
