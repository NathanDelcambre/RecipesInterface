import 'package:flutter/material.dart';
import '../../../database/database.dart';
import '../../../constants/numeric_statics.dart';

class RecetteCard extends StatefulWidget {
  const RecetteCard({super.key, required this.recette});
  final RecetteData recette;

  @override
  State<RecetteCard> createState() => _RecetteCardState();
}

class _RecetteCardState extends State<RecetteCard> {
  @override
  Widget build(BuildContext context) {
    int ingredientCount = widget.recette.ingredients.split(", ").length;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Statics.smallRoundedEdges),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(Statics.smallRoundedEdges), topRight: Radius.circular(Statics.smallRoundedEdges)),
              ),
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Statics.smallRoundedEdges),
                  topRight: Radius.circular(Statics.smallRoundedEdges),
                ),
                child: widget.recette.photo != "" ?
                Image.network(
                  widget.recette.photo,
                  fit: BoxFit.cover,
                ) :
                Image.asset(
                  'assets/placeholder.png', fit: BoxFit.cover
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(Statics.mediumPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.recette.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: Statics.cardTitleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.recette.pitch,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: Statics.cardTextFontSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '⏱ ${widget.recette.duration} mn',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Statics.cardTextFontSize,
                        ),
                      ),
                      Text(
                        '🧂 ${ingredientCount > 99 ? "+20" : ingredientCount} ingrédients',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Statics.cardTextFontSize,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}