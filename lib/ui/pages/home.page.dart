import 'package:flutter/material.dart';
import 'package:les_recettes_de_nathan/database/database.dart';
import 'package:les_recettes_de_nathan/ui/widgets/recipes/recipes_list.widget.dart';
import '../../constants//string_statics.dart';
import '../../services/recipes.service.dart';
import '../../utils/navigation.utils.dart';
import '../../utils/recipes.utils.dart';
import '../widgets/appBar/app_bar.widget.dart';
import '../widgets/fab/fab.widget.dart';
import '../../constants/numeric_statics.dart';
import '../widgets/recipes/category_chips.widget.dart';
import '../widgets/recipes/delete_dialog.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<RecetteData>? recettes;
  Set<String> selectedCategories = <String>{};
  final RecipesService recipesService = RecipesService();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    double appBarHeight = isLandscape ? MediaQuery.of(context).size.height / 6 : 80;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: const MyAppBar(),
      ),
      body: FutureBuilder<List<RecetteData>>(
        future: recipesService.getRecipes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // WAITING STATE
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // ERROR STATE
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // EMPTY RECIPES LIST
            return const Center(child: Text(AppStrings.noRecipe));
          } else {
            // LIST OF RECIPES
            recettes = snapshot.data!;
            return Column(
              children: [
                CategoryChips.buildFilterChipsRow(
                  selectedCategories,
                      (bool selected, String category) {
                    setState(() {
                      if (selected) {
                        selectedCategories.add(category);
                      } else {
                        selectedCategories.remove(category);
                      }
                    });
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: Statics.mediumPadding, bottom: Statics.mediumPadding, left: Statics.smallPadding, right: Statics.smallPadding),
                    child: RecipesList(recettes: _filterRecipes(recettes))
                  ),
                ),
              ],
            );
          }
        },
      ),
      floatingActionButton: ExpandableFab(
        distance: 80,
        children: [
          ActionButton(
            onPressed: () => NavigationUtils.showPopUp(context),
            icon: const Icon(Icons.info),
          ),
          ActionButton(
            onPressed: () => NavigationUtils.navigateToAddRecipe(context, null),
            icon: const Icon(Icons.add),
          ),
          ActionButton(
            onPressed: () async {
              RecetteData? deletedRecipe = await showDialog<RecetteData>(
                context: context,
                builder: (context) => RecipeListAlertDialog(recettes: recettes!),
              );

              if (deletedRecipe != null) {
                _deleteRecipe(deletedRecipe);
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

  List<RecetteData> _filterRecipes(List<RecetteData>? recipes) {
    return RecipeUtils.filterRecipes(recipes, selectedCategories);
  }

  void _deleteRecipe(RecetteData recipe) async {
    await recipesService.deleteRecipe(recipe.id);

    setState(() {
      recettes!.remove(recipe);
    });
  }
}
