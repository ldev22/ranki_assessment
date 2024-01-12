// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CardDao? _cardDAOInstance;

  CountryDao? _countryDAOInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `cards` (`id` INTEGER NOT NULL, `cardHolder` TEXT NOT NULL, `cardNumber` INTEGER NOT NULL, `cvv` INTEGER NOT NULL, `cardType` TEXT NOT NULL, `country` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `countries` (`id` INTEGER NOT NULL, `country` TEXT NOT NULL, `isBanned` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CardDao get cardDAO {
    return _cardDAOInstance ??= _$CardDao(database, changeListener);
  }

  @override
  CountryDao get countryDAO {
    return _countryDAOInstance ??= _$CountryDao(database, changeListener);
  }

  @override
  CardDao get cardDao =>
      _cardDAOInstance ??= _$CardDao(database, changeListener);

  @override
  CountryDao get countryDao =>
      _countryDAOInstance ??= _$CountryDao(database, changeListener);
}

class _$CardDao extends CardDao {
  _$CardDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _cardModelInsertionAdapter = InsertionAdapter(
            database,
            'cards',
            (CardModel item) => <String, Object?>{
                  'id': item.id,
                  'cardHolder': item.cardHolder,
                  'cardNumber': item.cardNumber,
                  'cvv': item.cvv,
                  'cardType': item.cardType,
                  'country': item.country
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CardModel> _cardModelInsertionAdapter;

  @override
  Future<List<CardModel>> getSavedCards() async {
    return _queryAdapter.queryList(
        'SELECT * FROM cards JOIN countries ON cards.country = countries.country WHERE countries.isBanned = 0',
        mapper: (Map<String, Object?> row) => CardModel(
            id: row['id'] as int,
            cardHolder: row['cardHolder'] as String,
            cardNumber: row['cardNumber'] as int,
            cardType: row['cardType'] as String,
            cvv: row['cvv'] as int,
            country: row['country'] as String));
  }

  @override
  Future<void> insertCard(CardModel card) async {
    await _cardModelInsertionAdapter.insert(card, OnConflictStrategy.abort);
  }
}

class _$CountryDao extends CountryDao {
  _$CountryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _countryModelInsertionAdapter = InsertionAdapter(
            database,
            'countries',
            (CountryModel item) => <String, Object?>{
                  'id': item.id,
                  'country': item.country,
                  'isBanned': item.isBanned
                }),
        _countryModelUpdateAdapter = UpdateAdapter(
            database,
            'countries',
            ['id'],
            (CountryModel item) => <String, Object?>{
                  'id': item.id,
                  'country': item.country,
                  'isBanned': item.isBanned
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CountryModel> _countryModelInsertionAdapter;

  final UpdateAdapter<CountryModel> _countryModelUpdateAdapter;

  @override
  Future<List<CountryModel>> getCountries() async {
    return _queryAdapter.queryList('SELECT * FROM countries WHERE isBanned=0R',
        mapper: (Map<String, Object?> row) => CountryModel(
            id: row['id'] as int,
            country: row['country'] as String,
            isBanned: row['isBanned'] as int));
  }

  @override
  Future<void> insertCountry(CountryModel country) async {
    await _countryModelInsertionAdapter.insert(
        country, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateCountry(CountryModel country) async {
    await _countryModelUpdateAdapter.update(country, OnConflictStrategy.abort);
  }
}
