import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/country_model.dart';

abstract class CountryLocalDataSource {
  Future<List<CountryModel>> getCountries();

  Future<void> insertCountry(CountryModel country);

  Future<void> updateCountry(CountryModel country);
}
