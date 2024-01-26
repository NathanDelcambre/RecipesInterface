import 'package:flutter/material.dart';

import '../../../constants/numeric_statics.dart';
import '../../../database/database.dart';

class RecipeListAlertDialog extends StatefulWidget {
  final List<RecetteData> recettes;

  const RecipeListAlertDialog({Key? key, required this.recettes}) : super(key: key);

  @override
  _RecipeListAlertDialogState createState() => _RecipeListAlertDialogState();
}

class _RecipeListAlertDialogState extends State<RecipeListAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/couverts.png', height: Statics.normalIconSize),
          const SizedBox(width: 8),
          const Text('Recettes'),
        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          children: widget.recettes.map((recipe) {
            return Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black87, width: 0.5)),
              ),
              child: Row(
                children: [
                  Expanded(child: Text(recipe.name)),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () {
                      _deleteRecipe(recipe);
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fermer', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }

  void _deleteRecipe(RecetteData recipe) {
    // Notify the parent widget that a recipe is deleted
    Navigator.of(context).pop(recipe);
  }
}
