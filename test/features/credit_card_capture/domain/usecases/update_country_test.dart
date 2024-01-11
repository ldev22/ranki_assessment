import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/update_country.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late UpdateCountryUseCase updateCountryUseCase;
  late MockCountryRepository mockCountryRepository;

  setUp(() {
    mockCountryRepository = MockCountryRepository();
    updateCountryUseCase = UpdateCountryUseCase(mockCountryRepository);
  });
  const testCountryEntity =
      CountryEntity(id: 1, country: 'South Africa', isBanned: 1);
  test('should be able to update a country', () async {
    await updateCountryUseCase.call(params: testCountryEntity);

    verify(mockCountryRepository.updateCountry(testCountryEntity)).called(1);
  });
}
