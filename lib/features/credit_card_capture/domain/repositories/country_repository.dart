import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';

abstract class CountryRepository {
  Future<List<CountryEntity>> getCountries();

  Future<void> saveCountry(CountryEntity countryEntity);

  Future<void> updateCountry(CountryEntity countryEntity);
}
