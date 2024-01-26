import 'package:flutter/material.dart';
import '../database/database.dart';
import '../constants/string_statics.dart';

class RecipeUtils {
  static List<RecetteData> filterRecipes(List<RecetteData>? recipes, Set<String> selectedCategories) {
    if (recipes == null) return [];
    if (selectedCategories.isEmpty) return recipes;
    return recipes.where((recipe) {
      return selectedCategories.contains(recipe.category);
    }).toList();
  }
}
