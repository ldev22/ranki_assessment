import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_country.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCountyUseCase getCountryUseCase;
  late MockCountryRepository mockCountryRepository;

  setUp(() {
    mockCountryRepository = MockCountryRepository();
    getCountryUseCase = GetCountyUseCase(mockCountryRepository);
  });

  const testCountryList = [
    CountryEntity(id: 1, country: 'South Africa', isBanned: 1),
    CountryEntity(id: 2, country: 'Namibia', isBanned: 0)
  ];

  test('should get list of countries from the repository', () async {
    when(mockCountryRepository.getCountries())
        .thenAnswer((_) async => testCountryList);

    final result = await getCountryUseCase.call();

    expect(result, testCountryList);
  });
}
