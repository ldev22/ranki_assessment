import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/country_local_data_source.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/country_model.dart';

class CountryLocalRepositoryImpl extends CountryLocalDataSource {
  final AppDatabase appDatabase;
  CountryLocalRepositoryImpl({required this.appDatabase});

  @override
  Future<List<CountryModel>> getCountries() {
    return appDatabase.countryDao.getCountries();
  }

  @override
  Future<void> insertCountry(CountryModel country) async {
    await appDatabase.countryDao.insertCountry(country);
  }

  @override
  Future<void> updateCountry(CountryModel country) async {
    await appDatabase.countryDao.updateCountry(country);
  }
}
