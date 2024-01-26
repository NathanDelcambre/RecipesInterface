import 'package:flutter/material.dart';
import '../../../constants/numeric_statics.dart';

class InformativeCard extends StatelessWidget {
  final String imagePath;
  final String infoText;

  const InformativeCard({
    Key? key,
    required this.imagePath,
    required this.infoText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.38,
        child: Padding(
          padding: const EdgeInsets.all(Statics.mediumPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                imagePath,
                width: Statics.normalIconSize,
                height: Statics.normalIconSize,
              ),
              Text(
                infoText,
                style: const TextStyle(fontSize: Statics.cardTitleFontSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
