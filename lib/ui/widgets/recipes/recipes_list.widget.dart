import 'package:flutter/material.dart';
import 'package:les_recettes_de_nathan/ui/widgets/recipes/recette_card.widget.dart';
import '../../../database/database.dart';
import '../../../constants/numeric_statics.dart';
import '../../../constants/string_statics.dart';
import '../../../utils/navigation.utils.dart';

class RecipesList extends StatefulWidget {
  const RecipesList({super.key, required this.recettes});

  final List<RecetteData>? recettes;

  @override
  State<RecipesList> createState() => _RecipesListState();
}

class _RecipesListState extends State<RecipesList> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: Statics.smallPadding / 1.8),
          child: Text(
            AppStrings.appName,
            style: TextStyle(
              fontSize: Statics.appTitleFontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: Statics.spacer16),
        Expanded(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              if (widget.recettes!.isEmpty) {
                return const Center(child: Text(AppStrings.noRecipe));
              }
              double screenWidth = constraints.maxWidth;

              int crossAxisCount = 2;

              if (screenWidth >= Statics.tabletBreakpoint) {
                crossAxisCount = 3;
              }
              if (screenWidth >= Statics.desktopBreakpoint) {
                crossAxisCount = 4;
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: Statics.cardHorizontalSpacing,
                  mainAxisSpacing: Statics.cardVerticalSpacing,
                ),
                itemCount: widget.recettes!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      NavigationUtils.navigateToRecipeDetail(
                          context, widget.recettes![index]);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: Statics.smallPadding, right: Statics.smallPadding / 3),
                      child: RecetteCard(
                        key: UniqueKey(),
                        recette: widget.recettes![index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}