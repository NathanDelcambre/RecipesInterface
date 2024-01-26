import 'package:flutter/material.dart';
import 'package:les_recettes_de_nathan/constants/string_statics.dart';
import 'package:les_recettes_de_nathan/services/recipes.service.dart';
import 'package:les_recettes_de_nathan/ui/pages/home.page.dart';
import 'package:les_recettes_de_nathan/ui/pages/loading.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RecipesService recipesService = RecipesService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    recipesService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'BreeSerif'
      ),
      home: FutureBuilder(
          future: initDatabase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // WAITING STATE
              return const WaitingScreen();
            } else if (snapshot.hasError) {
              // ERROR STATE
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const HomePage();
            }
          }
      )
    );
  }

  Future<bool> initDatabase() async {
    await recipesService.clearDatabase();
    await recipesService.insertDefaultRecipes();
    return true;
  }
}
