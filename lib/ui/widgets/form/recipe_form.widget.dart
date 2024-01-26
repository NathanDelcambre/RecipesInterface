import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:drift/drift.dart' as drift;
import 'package:image_picker/image_picker.dart';
import '../../../database/database.dart';
import '../../../constants/numeric_statics.dart';
import '../../../constants/string_statics.dart';
import '../../../services/recipes.service.dart';
import '../../pages/home.page.dart';

class RecipeForm extends StatefulWidget {
  const RecipeForm({Key? key, this.recette}) : super(key: key);

  final RecetteData? recette;

  @override
  _RecipeFormState createState() => _RecipeFormState();
}

class _RecipeFormState extends State<RecipeForm> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  late int duration;
  File? _imageFile;
  final RecipesService recipesService = RecipesService();

  @override
  void initState() {
    super.initState();
    duration = widget.recette?.duration ?? 5;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      initialValue: {
        'name': widget.recette?.name,
        'pitch': widget.recette?.pitch,
        'description': widget.recette?.description,
        'ingredients': widget.recette?.ingredients,
        'duration': widget.recette?.duration,
        'category': widget.recette?.category,
        'photo': widget.recette?.photo,
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildFormField(
            name: 'name',
            label: 'Nom de la recette',
            icon: Icons.restaurant,
            maxLines: 1,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.noRecipeName;
              }
              return null;
            }
          ),
          const SizedBox(height: Statics.spacer16),
          _buildFormField(
              name: 'pitch',
              label: 'Pitch',
              icon: Icons.bubble_chart,
              maxLines: 1),
          const SizedBox(height: Statics.spacer16),
          _buildFormField(
            name: 'description',
            label: 'Description',
            icon: Icons.speaker_notes_rounded,
            maxLines: 3,
          ),
          const SizedBox(height: Statics.spacer16),
          _buildFormField(
            name: 'ingredients',
            label: 'Ingrédients (séparés par des virgules)',
            icon: Icons.fastfood_rounded,
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppStrings.noRecipeIngredient;
              }
              return null;
            },
          ),
          const SizedBox(height: Statics.spacer16),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(Statics.smallPadding),
            child: Row(
              children: [
                const Icon(Icons.timer, size: Statics.normalIconSize - 3, color: Color.fromRGBO(70, 70, 70, 1)),
                const Text(
                  '   Durée : ',
                  style: TextStyle(
                      fontSize: Statics.cardTitleFontSize,
                      color: Color.fromRGBO(70, 70, 70, 1)),
                ),
                IconButton(
                  onPressed: duration > 5
                      ? () {
                          setState(() {
                            duration -= 5;
                            _formKey.currentState?.fields['duration']
                                ?.didChange(duration);
                          });
                        }
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Text('$duration mn'),
                IconButton(
                  onPressed: () {
                    setState(() {
                      duration += 5;
                      _formKey.currentState?.fields['duration']
                          ?.didChange(duration);
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
          const SizedBox(height: Statics.spacer16),
          FormBuilderDropdown(
            name: 'category',
            decoration: const InputDecoration(
              labelText: 'Catégorie',
              prefixIcon: Icon(Icons.emoji_food_beverage_rounded),
              border: OutlineInputBorder(),
            ),
            items: [
              'Entrées',
              'Salades',
              'Soupes',
              'Viandes',
              'Plats de fruits de mer',
              'Plats chauds',
              'Plats froids',
              'Plats du monde',
              'Fast-Food',
              'Desserts',
              'Végétarien',
              'Végétalien'
            ]
                .map((category) => DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    ))
                .toList(),
          ),
          const SizedBox(height: Statics.spacer16),
          Row(
            children: [
              Expanded(
                child: _buildFormField(
                  name: 'photo',
                  label: "URL de l'image: ",
                  icon: Icons.photo_camera_back_outlined,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: Statics.mediumPadding),
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color.fromRGBO(70, 70, 70, 1),
                    width: 1.0,
                  ),
                ),
                child: IconButton(
                  icon: const Icon(Icons.photo_camera),
                  onPressed: _pickImage,
                ),
              ),
            ],
          ),
          const SizedBox(height: Statics.spacer16),
          ElevatedButton(
            onPressed: () async {
              _formKey.currentState?.save();
              if (_formKey.currentState?.validate() ?? false) {
                final entity = RecetteCompanion(
                  id: drift.Value(
                      widget.recette?.id ?? (await recipesService.getRecipes()).length + 1),
                  name: drift.Value(
                      _formKey.currentState?.fields['name']?.value ?? ''),
                  pitch: drift.Value(
                      _formKey.currentState?.fields['pitch']?.value ?? ''),
                  description: drift.Value(
                      _formKey.currentState?.fields['description']?.value ??
                          ''),
                  duration: drift.Value(
                      _formKey.currentState?.fields['duration']?.value ??
                          duration),
                  ingredients: drift.Value(
                      _formKey.currentState?.fields['ingredients']?.value ??
                          ''),
                  category: drift.Value(
                      _formKey.currentState?.fields['category']?.value ?? ''),
                  photo: drift.Value(
                      _formKey.currentState?.fields['photo']?.value ?? ''),
                );

                if (widget.recette != null) {
                  await recipesService.updateRecipe(entity).then((value) {
                    ScaffoldMessenger.of(context)
                        .showMaterialBanner(MaterialBanner(
                      backgroundColor: Colors.green,
                      content: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10.0),
                        child: const Text(AppStrings.updatedRecipe),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner(),
                        ),
                      ],
                    ));

                    Future.delayed(const Duration(seconds: 2), () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      Navigator.pop(context);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    });
                  });
                } else {
                  recipesService.insertRecipe(entity).then((value) {
                    ScaffoldMessenger.of(context)
                        .showMaterialBanner(MaterialBanner(
                      backgroundColor: Colors.green,
                      content: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 10.0),
                        child: const Text(AppStrings.addedRecipe),
                      ),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => ScaffoldMessenger.of(context)
                              .hideCurrentMaterialBanner(),
                        ),
                      ],
                    ));

                    Future.delayed(const Duration(seconds: 2), () {
                      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                      Navigator.pop(context);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    });
                  });
                }
              }
            },
            style: ElevatedButton.styleFrom(
                elevation: 5, backgroundColor: Statics.whiteBrown),
            child: const Text(
              'Valider',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String name,
    required String label,
    IconData? icon,
    FormFieldValidator? validator,
    TextInputType? keyboardType,
    int? maxLines,
    bool enabled = true
  }) {
    return FormBuilderTextField(
      name: name,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: const OutlineInputBorder(),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green, width: 2.0),
        ),
      ),
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      enabled: enabled,
      cursorColor: Colors.black,
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _imageFile = File(pickedImage.path);
        _formKey.currentState?.fields['photo']?.didChange(_imageFile?.path);
      });
    }
  }
}
