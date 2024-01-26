// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RecetteTable extends Recette with TableInfo<$RecetteTable, RecetteData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecetteTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 600),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pitchMeta = const VerificationMeta('pitch');
  @override
  late final GeneratedColumn<String> pitch = GeneratedColumn<String>(
      'pitch', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 300),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 0, maxTextLength: 10000),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _durationMeta =
      const VerificationMeta('duration');
  @override
  late final GeneratedColumn<int> duration = GeneratedColumn<int>(
      'duration', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _ingredientsMeta =
      const VerificationMeta('ingredients');
  @override
  late final GeneratedColumn<String> ingredients = GeneratedColumn<String>(
      'ingredients', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Autres'));
  static const VerificationMeta _photoMeta = const VerificationMeta('photo');
  @override
  late final GeneratedColumn<String> photo = GeneratedColumn<String>(
      'photo', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, pitch, description, duration, ingredients, category, photo];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recette';
  @override
  VerificationContext validateIntegrity(Insertable<RecetteData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('pitch')) {
      context.handle(
          _pitchMeta, pitch.isAcceptableOrUnknown(data['pitch']!, _pitchMeta));
    } else if (isInserting) {
      context.missing(_pitchMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    }
    if (data.containsKey('ingredients')) {
      context.handle(
          _ingredientsMeta,
          ingredients.isAcceptableOrUnknown(
              data['ingredients']!, _ingredientsMeta));
    } else if (isInserting) {
      context.missing(_ingredientsMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('photo')) {
      context.handle(
          _photoMeta, photo.isAcceptableOrUnknown(data['photo']!, _photoMeta));
    } else if (isInserting) {
      context.missing(_photoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecetteData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecetteData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      pitch: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pitch'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      duration: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}duration']),
      ingredients: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}ingredients'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      photo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}photo'])!,
    );
  }

  @override
  $RecetteTable createAlias(String alias) {
    return $RecetteTable(attachedDatabase, alias);
  }
}

class RecetteData extends DataClass implements Insertable<RecetteData> {
  final int id;
  final String name;
  final String pitch;
  final String description;
  final int? duration;
  final String ingredients;
  final String category;
  final String photo;
  const RecetteData(
      {required this.id,
      required this.name,
      required this.pitch,
      required this.description,
      this.duration,
      required this.ingredients,
      required this.category,
      required this.photo});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['pitch'] = Variable<String>(pitch);
    map['description'] = Variable<String>(description);
    if (!nullToAbsent || duration != null) {
      map['duration'] = Variable<int>(duration);
    }
    map['ingredients'] = Variable<String>(ingredients);
    map['category'] = Variable<String>(category);
    map['photo'] = Variable<String>(photo);
    return map;
  }

  RecetteCompanion toCompanion(bool nullToAbsent) {
    return RecetteCompanion(
      id: Value(id),
      name: Value(name),
      pitch: Value(pitch),
      description: Value(description),
      duration: duration == null && nullToAbsent
          ? const Value.absent()
          : Value(duration),
      ingredients: Value(ingredients),
      category: Value(category),
      photo: Value(photo),
    );
  }

  factory RecetteData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecetteData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      pitch: serializer.fromJson<String>(json['pitch']),
      description: serializer.fromJson<String>(json['description']),
      duration: serializer.fromJson<int?>(json['duration']),
      ingredients: serializer.fromJson<String>(json['ingredients']),
      category: serializer.fromJson<String>(json['category']),
      photo: serializer.fromJson<String>(json['photo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'pitch': serializer.toJson<String>(pitch),
      'description': serializer.toJson<String>(description),
      'duration': serializer.toJson<int?>(duration),
      'ingredients': serializer.toJson<String>(ingredients),
      'category': serializer.toJson<String>(category),
      'photo': serializer.toJson<String>(photo),
    };
  }

  RecetteData copyWith(
          {int? id,
          String? name,
          String? pitch,
          String? description,
          Value<int?> duration = const Value.absent(),
          String? ingredients,
          String? category,
          String? photo}) =>
      RecetteData(
        id: id ?? this.id,
        name: name ?? this.name,
        pitch: pitch ?? this.pitch,
        description: description ?? this.description,
        duration: duration.present ? duration.value : this.duration,
        ingredients: ingredients ?? this.ingredients,
        category: category ?? this.category,
        photo: photo ?? this.photo,
      );
  @override
  String toString() {
    return (StringBuffer('RecetteData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pitch: $pitch, ')
          ..write('description: $description, ')
          ..write('duration: $duration, ')
          ..write('ingredients: $ingredients, ')
          ..write('category: $category, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, pitch, description, duration, ingredients, category, photo);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecetteData &&
          other.id == this.id &&
          other.name == this.name &&
          other.pitch == this.pitch &&
          other.description == this.description &&
          other.duration == this.duration &&
          other.ingredients == this.ingredients &&
          other.category == this.category &&
          other.photo == this.photo);
}

class RecetteCompanion extends UpdateCompanion<RecetteData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> pitch;
  final Value<String> description;
  final Value<int?> duration;
  final Value<String> ingredients;
  final Value<String> category;
  final Value<String> photo;
  const RecetteCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.pitch = const Value.absent(),
    this.description = const Value.absent(),
    this.duration = const Value.absent(),
    this.ingredients = const Value.absent(),
    this.category = const Value.absent(),
    this.photo = const Value.absent(),
  });
  RecetteCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String pitch,
    required String description,
    this.duration = const Value.absent(),
    required String ingredients,
    this.category = const Value.absent(),
    required String photo,
  })  : name = Value(name),
        pitch = Value(pitch),
        description = Value(description),
        ingredients = Value(ingredients),
        photo = Value(photo);
  static Insertable<RecetteData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? pitch,
    Expression<String>? description,
    Expression<int>? duration,
    Expression<String>? ingredients,
    Expression<String>? category,
    Expression<String>? photo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (pitch != null) 'pitch': pitch,
      if (description != null) 'description': description,
      if (duration != null) 'duration': duration,
      if (ingredients != null) 'ingredients': ingredients,
      if (category != null) 'category': category,
      if (photo != null) 'photo': photo,
    });
  }

  RecetteCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? pitch,
      Value<String>? description,
      Value<int?>? duration,
      Value<String>? ingredients,
      Value<String>? category,
      Value<String>? photo}) {
    return RecetteCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      pitch: pitch ?? this.pitch,
      description: description ?? this.description,
      duration: duration ?? this.duration,
      ingredients: ingredients ?? this.ingredients,
      category: category ?? this.category,
      photo: photo ?? this.photo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (pitch.present) {
      map['pitch'] = Variable<String>(pitch.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (ingredients.present) {
      map['ingredients'] = Variable<String>(ingredients.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (photo.present) {
      map['photo'] = Variable<String>(photo.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecetteCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('pitch: $pitch, ')
          ..write('description: $description, ')
          ..write('duration: $duration, ')
          ..write('ingredients: $ingredients, ')
          ..write('category: $category, ')
          ..write('photo: $photo')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $RecetteTable recette = $RecetteTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [recette];
}
