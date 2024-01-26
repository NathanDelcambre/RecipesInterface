import 'package:les_recettes_de_nathan/database/database.dart';

class DatabaseSingleton {
  static final AppDatabase _appDatabase = AppDatabase();

  AppDatabase get instance => _appDatabase;

  DatabaseSingleton._privateConstructor();

  static final DatabaseSingleton _instance = DatabaseSingleton._privateConstructor();

  factory DatabaseSingleton() {
    return _instance;
  }
}

