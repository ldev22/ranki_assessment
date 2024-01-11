import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/country_local_data_source.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/country_model.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAppDatabase mockAppDatabase;
  late CountryLocalDataSourceImpl countryLocalDataSourceImpl;
  late MockCountryDao mockCountryDao;
  setUp(() {
    mockCountryDao = MockCountryDao();
    mockAppDatabase = MockAppDatabase();
    countryLocalDataSourceImpl =
        CountryLocalDataSourceImpl(appDatabase: mockAppDatabase);
  });

  const testCountryModel = CountryModel(id: 1, country: 'Namibia', isBanned: 1);

  const testCountryList = [
    CountryModel(id: 1, country: 'USA', isBanned: 0),
    CountryModel(id: 2, country: 'South Africa', isBanned: 0),
    CountryModel(id: 3, country: 'Namiba', isBanned: 1),
  ];

  group('Database country test', () {
    test('get countries from database', () async {
      when(mockAppDatabase.countryDao).thenReturn(mockCountryDao);
      when(mockCountryDao.getCountries())
          .thenAnswer((_) async => testCountryList);

      final result = await countryLocalDataSourceImpl.getCountries();

      expect(result, testCountryList);
    });

    test('save a country to the database', () async {
      when(mockAppDatabase.countryDao).thenReturn(mockCountryDao);

      await countryLocalDataSourceImpl.insertCountry(testCountryModel);

      verify(mockCountryDao.insertCountry(testCountryModel)).called(1);
    });

    test('update a country in the database', () async {
      when(mockAppDatabase.countryDao).thenReturn(mockCountryDao);

      await countryLocalDataSourceImpl.updateCountry(testCountryModel);

      verify(mockCountryDao.updateCountry(testCountryModel)).called(1);
    });
  });
}
