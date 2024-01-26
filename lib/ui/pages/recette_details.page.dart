import 'package:flutter/material.dart';
import 'package:les_recettes_de_nathan/utils/navigation.utils.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../database/database.dart';
import '../../constants/numeric_statics.dart';
import '../widgets/details/informative_card.widget.dart';

class RecipeDetailPage extends StatelessWidget {
  final RecetteData recette;

  const RecipeDetailPage({Key? key, required this.recette}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Statics statics = Statics();
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: isLandscape ? 50 : 60,
        actions: [
          Padding(
            padding: const EdgeInsets.all(Statics.smallPadding),
            child: IconButton(
              icon: const Icon(Icons.share),
              onPressed: () async {
                await _shareBySMS(context, recette);
              },
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            !isLandscape ? Container(
              height: statics.getHalfHeight(context),
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: recette.photo != ""
                      ? NetworkImage(recette.photo)
                      : const AssetImage('assets/placeholder.png') as ImageProvider<Object>,
                  fit: BoxFit.cover,
                ),
              ),
            ) : const SizedBox(height: 0),
            Positioned.fill(
              top: !isLandscape ? MediaQuery.of(context).size.height / 3 : 0,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(Statics.largeRoundedEdges),
                  topRight: Radius.circular(Statics.largeRoundedEdges),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(Statics.largePadding + 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recette.name,
                            style: const TextStyle(
                              fontSize: Statics.appTitleFontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Statics.spacer16),
                          Text(
                            recette.pitch,
                            style: const TextStyle(fontSize: Statics.cardTitleFontSize),
                          ),
                          const SizedBox(height: Statics.spacer16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InformativeCard(
                                imagePath: 'assets/chrono.png',
                                infoText: '${recette.duration} minutes',
                              ),
                              const SizedBox(width: Statics.spacer20),
                              InformativeCard(
                                imagePath: 'assets/ingredients.png',
                                infoText: '${recette.ingredients.split(", ").length} ingréd.',
                              ),
                            ],
                          ),
                          const SizedBox(height: Statics.spacer16),
                          const Text(
                            'Ingrédients:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: Statics.spacer16 / 2),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: recette.ingredients.split(', ').map((ingredient) => Text(
                              '● $ingredient',
                              style: const TextStyle(fontSize: 16),
                            )).toList(),
                          ),
                          const SizedBox(height: Statics.spacer16 * 2),
                          const Text('Étapes de réalisation :', style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                          const SizedBox(height: Statics.spacer16),
                          Text(recette.description, style: const TextStyle(fontSize: 16))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: !isLandscape ? MediaQuery.of(context).size.height / 3.2 : MediaQuery.of(context).size.height - 200,
              right: Statics.spacer20 * 2,
              child: ElevatedButton(
                onPressed: () {
                  NavigationUtils.navigateToAddRecipe(context, recette);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Icon(Icons.mode, color: Colors.black, size: Statics.normalIconSize - 5),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }

  Future<void> _shareBySMS(BuildContext context, RecetteData recette) async {
    String message = "Voici une recette qui peut vous intéresser !\n${recette.name}\nCela vous prendra ${recette.duration} minutes !";

    final Uri uri = Uri(scheme: 'sms', path: '', queryParameters: {'body': message});
    await launchUrl(uri);
  }
}
