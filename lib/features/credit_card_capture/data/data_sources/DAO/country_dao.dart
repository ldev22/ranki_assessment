import 'package:floor/floor.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/country_model.dart';

@dao
abstract class CountryDao {
  @Insert()
  Future<void> insertCountry(CountryModel country);

  @Update()
  Future<void> updateCountry(CountryModel country);

  @Query('SELECT * FROM countries WHERE isBanned = 0')
  Future<List<CountryModel>> getCountries();
}
