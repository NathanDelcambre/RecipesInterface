import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import '../data/recipes.dart';

part 'database.g.dart';

class Recette extends Table {
  IntColumn get id => integer().named('id')();
  TextColumn get name => text().named('name').withLength(min: 0, max: 600)();
  TextColumn get pitch => text().named('pitch').withLength(min: 0, max: 300)();
  TextColumn get description => text().named('description').withLength(min: 0, max: 10000)();
  IntColumn get duration => integer().named('duration').nullable()();
  TextColumn get ingredients => text().named('ingredients')();
  TextColumn get category => text().named('category').withDefault(const Constant('Autres'))();
  TextColumn get photo => text().named('photo')();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Recette])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<RecetteData>> getRecipes() async {
    return await select(recette).get();
  }

  Future<RecetteData> getRecipe(int id) async {
    return await (select(recette)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<bool> updateRecipe(RecetteCompanion companion) async {
    return await update(recette).replace(companion);
  }

  Future<int> insertRecipe(RecetteCompanion companion) async {
    return await into(recette).insert(companion);
  }

  Future<int> deleteRecipe(int id) async {
    return await (delete(recette)..where((tbl) => tbl.id.equals(id))).go();
  }

  Future<void> insertDefaultRecipes() async {
    for (final recipe in defaultRecipes) {
      await insertRecipe(recipe);
    }
  }

  Future<void> clearDatabase() async {
    await delete(recette).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'recettes.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    return NativeDatabase.createInBackground(file);
  });
}

