import 'package:flutter/material.dart';
import '../../../constants/numeric_statics.dart';
import '../../../constants/string_statics.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    double appBarHeight = isLandscape ? MediaQuery.of(context).size.height / 8 : 80;

    return AppBar(
      toolbarHeight: appBarHeight,
      title: const Text(AppStrings.noText),
      actions: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(Statics.smallPadding),
                child: Image.asset(
                  'assets/plante.png',
                  height: Statics.normalIconSize,
                ),
              ),
              Image.asset(
                'assets/ustensiles.png',
                height: Statics.largeIconSize,
              ),
              Padding(
                padding: const EdgeInsets.all(Statics.smallPadding),
                child: Image.asset(
                  'assets/plante.png',
                  height: Statics.normalIconSize,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
