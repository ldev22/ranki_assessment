import 'package:mockito/annotations.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/DAO/card_dao.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/DAO/country_dao.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/card_repository.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/country_repository.dart';

@GenerateMocks(
    [CardRepository, CountryRepository, AppDatabase, CountryDao, CardDao])
void main() {}
