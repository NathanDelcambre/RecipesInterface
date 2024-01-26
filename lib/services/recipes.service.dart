import 'package:les_recettes_de_nathan/database/database_singleton.dart';

import '../database/database.dart';

class RecipesService {
  final AppDatabase db = DatabaseSingleton().instance;

  Future<void> deleteRecipe(int recipeId) async {
    await db.deleteRecipe(recipeId);
  }

  Future<void> updateRecipe(RecetteCompanion recipe) async {
    await db.updateRecipe(recipe);
  }

  Future<List<RecetteData>> getRecipes() async {
    return await db.getRecipes();
  }

  Future<RecetteData> getRecipe(int id) async {
    return await db.getRecipe(id);
  }

  Future<int> insertRecipe(RecetteCompanion companion) async {
    return await db.insertRecipe(companion);
  }

  Future<void> insertDefaultRecipes() async {
    return await db.insertDefaultRecipes();
  }

  Future<void> clearDatabase() async {
    return await db.clearDatabase();
  }

  Future<void> close() async {
    return db.close();
  }
}