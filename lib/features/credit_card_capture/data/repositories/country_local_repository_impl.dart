import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/country_model.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/country_repository.dart';

class CountryLocalRepositoryImpl extends CountryRepository {
  final AppDatabase appDatabase;
  CountryLocalRepositoryImpl({required this.appDatabase});

  @override
  Future<List<CountryModel>> getCountries() {
    return appDatabase.countryDao.getCountries();
  }

  @override
  Future<void> saveCountry(CountryEntity country) async {
    await appDatabase.countryDao
        .insertCountry(CountryModel.fromEntity(country));
  }

  @override
  Future<void> updateCountry(CountryEntity countryEntity) async {
    await appDatabase.countryDao
        .updateCountry(CountryModel.fromEntity(countryEntity));
  }
}
