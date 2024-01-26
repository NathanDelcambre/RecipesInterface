import 'package:flutter/material.dart';

class Statics {
  // SPACING
  static const double cardHorizontalSpacing = 15.0;
  static const double cardVerticalSpacing = 15.0;

  // EDGES
  static const double largeRoundedEdges = 40.0;
  static const double normalRoundedEdges = 20.0;
  static const double smallRoundedEdges = 10.0;

  // PADDING
  static const double smallPadding = 12.0;
  static const double mediumPadding = 16.0;
  static const double largePadding = 20.0;

  // FONTS
  static const double appTitleFontSize = 28.0;
  static const double cardTitleFontSize = 15.0;
  static const double cardTextFontSize = 11.0;

  // MEDIA QUERY
  double getHalfWidth(BuildContext context) {
    return MediaQuery.of(context).size.width * 0.5;
  }

  double getHalfHeight(BuildContext context) {
    return MediaQuery.of(context).size.height * 0.5;
  }

  // ICONS
  static const double smallIconSize = 20;
  static const double normalIconSize = 32;
  static const double largeIconSize = 48;

  // SPACERS
  static const double spacer10 = 10.0;
  static const double spacer16 = 10.0;
  static const double spacer20 = 20.0;
  static const double spacer30 = 30.0;

  // COLORS
  static const Color whiteBrown = Color.fromRGBO(240, 220, 200, 1);

  // BREAKPOINTS
  static const double desktopBreakpoint = 1100.0;
  static const double tabletBreakpoint = 700.0;
}