import 'package:flutter/material.dart';

import '../../../data/categories.dart';
import '../../../constants/numeric_statics.dart';

class CategoryChips {
  static Widget buildFilterChipsRow(
      Set<String> selectedCategories, Function(bool, String) onCategorySelected) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(Categories.categories.length, (index) {
          String category = Categories.categories[index];
          bool isSelected = selectedCategories.contains(category);
          EdgeInsets padding;

          if (index == Categories.categories.length - 1) {
            padding = const EdgeInsets.only(
                left: Statics.smallPadding,
                bottom: Statics.smallPadding,
                right: 15);
          } else {
            padding = const EdgeInsets.only(
                left: Statics.smallPadding, bottom: Statics.smallPadding);
          }

          return Padding(
            padding: padding,
            child: FilterChip(
              avatar: Image.asset(
                Categories.categoryAssets
                    .firstWhere((element) => element.keys.first == category)[category]!,
                width: Statics.normalIconSize,
                height: Statics.normalIconSize,
              ),
              label: Text(category),
              selected: isSelected,
              onSelected: (bool selected) {
                onCategorySelected(selected, category);
              },
            ),
          );
        }),
      ),
    );
  }
}