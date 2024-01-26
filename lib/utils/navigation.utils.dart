import 'package:flutter/material.dart';
import 'package:les_recettes_de_nathan/ui/pages/home.page.dart';
import '../database/database.dart';
import '../constants/string_statics.dart';
import '../ui/pages/recette_details.page.dart';
import '../ui/pages/form.page.dart';

class NavigationUtils {
  static void navigateToRecipeDetail(BuildContext context, RecetteData recette) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RecipeDetailPage(recette: recette),
      ),
    );
  }

  static void navigateToAddRecipe(BuildContext context, RecetteData? recette) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => AddRecipePage(recette: recette),
      ),
    );
  }

  static void navigateToHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  static void showPopUp(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: AlertDialog(
            surfaceTintColor: Colors.transparent,
            title: const Text('Informations'),
            content: const Text(AppStrings.informations,
              textAlign: TextAlign.justify,
            ),

            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Fermer'),
              ),
            ],
          ),
        );
      },
    );
  }
}
