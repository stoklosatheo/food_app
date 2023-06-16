import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_app/models/recipes_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<RecipeList> futureRecipe;

  @override
  void initState() {
    super.initState();
    futureRecipe = fetchRecipeList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(children: [
                  FutureBuilder<RecipeList>(
                    future: futureRecipe,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                            height: 600,
                            child: ListView.separated(
                                itemBuilder: (context, index) {
                                  return Card(
                                      elevation: 3,
                                      child: Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                              color: Colors.black,
                                              image: DecorationImage(
                                                  opacity: 0.8,
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(snapshot
                                                      .data!
                                                      .recipes[index]
                                                      .thumbnail))),
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
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                      snapshot.data!
                                                          .recipes[index].name
                                                          .toUpperCase()),
                                                  Row(
                                                    children: [
                                                      for (var i = 0;
                                                          i < 5;
                                                          i++)
                                                        Text(snapshot
                                                            .data!
                                                            .recipes[index]
                                                            .tags![i]
                                                            .displayName)
                                                    ],
                                                  )
                                                ],
                                              ))));
                                },
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 10);
                                },
                                itemCount: 3));
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      // By default, show a loading spinner.
                      return const CircularProgressIndicator();
                    },
                  ),
                ]))));
  }
}
