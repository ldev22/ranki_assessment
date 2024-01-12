import 'package:mockito/annotations.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/DAO/card_dao.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/DAO/country_dao.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/card_repository.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/country_repository.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/update_country.dart';

@GenerateMocks([
  GetCountyUseCase,
  SaveCountryUseCase,
  UpdateCountryUseCase,
  CardRepository,
  CountryRepository,
  AppDatabase,
  GetCardUseCase,
  SaveCardUseCase,
  CountryDao,
  CardDao,
])
void main() {}
