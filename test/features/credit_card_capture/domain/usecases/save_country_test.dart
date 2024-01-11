import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_country.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveCountryUseCase saveCountryUseCase;
  late MockCountryRepository mockCountryRepository;

  setUp(() {
    mockCountryRepository = MockCountryRepository();
    saveCountryUseCase = SaveCountryUseCase(mockCountryRepository);
  });
  const testCountryEntity =
      CountryEntity(id: 1, country: 'South Africa', isBanned: 0);
  test('should be able to save a country', () async {
    await saveCountryUseCase.call(params: testCountryEntity);

    verify(mockCountryRepository.saveCountry(testCountryEntity)).called(1);
  });
}
