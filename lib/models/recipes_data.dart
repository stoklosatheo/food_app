import 'dart:convert';

import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'X-RapidAPI-Key': '425d181a13mshd462af39b9f5cf6p196127jsn1359e085137a',
  'X-RapidAPI-Host': 'tasty.p.rapidapi.com',
};

Future<RecipeList> fetchRecipeList() async {
  final response = await http.get(
      Uri.parse('https://tasty.p.rapidapi.com/recipes/list'),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return RecipeList.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load recipes');
  }
}

class RecipeList {
  RecipeList({required this.recipes});

  List<Recipe> recipes;

  factory RecipeList.fromJson(Map<String, dynamic> json) {
    // print(List<Recipe>.from(json['results'].map((x) => x['name'])));
    return RecipeList(
      recipes:
          List<Recipe>.from(json['results'].map((x) => Recipe.fromJson(x))),
    );
  }
}

class Recipe {
  const Recipe(
      {required this.name,
      required this.thumbnail,
      required this.servings,
      required this.steps,
      this.cookingTime,
      this.prepTime,
      this.tags,
      this.description});

  final String name;
  final String thumbnail;
  final List<Tags>? tags;
  final String? description;
  final int servings;
  final int? cookingTime;
  final Map<String, dynamic> steps;
  final int? prepTime;

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
        name: json['name'],
        thumbnail: json['thumbnail_url'],
        description: json['description'],
        servings: json['num_servings'],
        cookingTime: json['cook_time_minutes'],
        prepTime: json['prep_time_minutes'],
        steps: json['instructions'],
        tags: List<Tags>.from(json['tags'].map((x) => Tags.fromJson(x))));
  }
}

class Tags {
  Tags({required this.id, required this.displayName});

  final int id;
  final String displayName;

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(id: json['id'], displayName: json['display_name']);
  }
}
