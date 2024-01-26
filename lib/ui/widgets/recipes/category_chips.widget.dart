import 'package:flutter/material.dart';

import '../../../data/categories.dart';
import '../../../constants/numeric_statics.dart';

class CategoryChips {
  static Widget buildFilterChipsRow(Set<String> selectedCategories, Function(bool, String) onCategorySelected) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Categories.categories.map((category) {
          bool isSelected = selectedCategories.contains(category);
          return Padding(
            padding: const EdgeInsets.only(left: Statics.smallPadding, bottom: Statics.smallPadding),
            child: FilterChip(
              label: Text(category),
              selected: isSelected,
              onSelected: (bool selected) {
                onCategorySelected(selected, category);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
