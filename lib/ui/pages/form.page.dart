import 'package:flutter/material.dart';
import 'package:les_recettes_de_nathan/ui/widgets/form/recipe_form.widget.dart';
import '../../constants/numeric_statics.dart';
import '../../constants/string_statics.dart';
import '../../database/database.dart';

class AddRecipePage extends StatelessWidget {
  const AddRecipePage({Key? key, this.recette}) : super(key: key);

  final RecetteData? recette;

  @override
  Widget build(BuildContext context) {
    final pageTitle = recette == null ? AppStrings.addRecipe : AppStrings.updateRecipe;
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.all(Statics.smallPadding),
            child: Image.asset(
              'assets/plante.png',
              height: Statics.normalIconSize,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Statics.mediumPadding),
          child: RecipeForm(recette: recette)
        ),
      ),
    );
  }
}
