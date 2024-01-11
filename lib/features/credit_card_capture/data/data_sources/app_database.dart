import 'dart:async';

import 'package:floor/floor.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/DAO/card_dao.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/DAO/country_dao.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/card_model.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/country_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'app_database.g.dart'; //generated code with floor builder for the data abstraction objects

@Database(version: 1, entities: [CardModel, CountryModel])
abstract class AppDatabase extends FloorDatabase {
  CardDao get cardDao;
  CountryDao get countryDao;
}
