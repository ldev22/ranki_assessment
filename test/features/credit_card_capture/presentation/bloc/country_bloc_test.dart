import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_state.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetCountyUseCase mockGetCountyUseCase;
  late MockSaveCountryUseCase mockSaveCountryUseCase;
  late MockUpdateCountryUseCase mockUpdateCountryUseCase;
  late CountryBloc countryBloc;

  setUp(() {
    mockGetCountyUseCase = MockGetCountyUseCase();
    mockSaveCountryUseCase = MockSaveCountryUseCase();
    mockUpdateCountryUseCase = MockUpdateCountryUseCase();
    countryBloc = CountryBloc(
        mockGetCountyUseCase, mockSaveCountryUseCase, mockUpdateCountryUseCase);
  });

  const testCountryDetailList = [
    CountryEntity(
      id: 1,
      country: 'South Africa',
      isBanned: 0,
    ),
    CountryEntity(
      id: 2,
      country: 'Namibia',
      isBanned: 1,
    )
  ];

  const testCountry = CountryEntity(id: 2, country: 'Namibia', isBanned: 1);

  blocTest<CountryBloc, CountryState>(
    'should emit [CountriesLoading, CountriesDoneLoading] when GetSavedCountry is added',
    build: () {
      when(mockGetCountyUseCase())
          .thenAnswer((_) async => testCountryDetailList);
      return countryBloc;
    },
    act: (bloc) async {
      bloc.add(const GetSavedCountries());
    },
    expect: () => [
      const CountriesLoading(),
      const CountriesDoneLoading(testCountryDetailList),
    ],
  );

  blocTest<CountryBloc, CountryState>(
      'calls saveCountry usecase and should emit [CountriesDoneLoading] when SaveCountry is added',
      build: () {
        when(mockSaveCountryUseCase(params: testCountry))
            .thenAnswer((_) async => {});
        when(mockGetCountyUseCase())
            .thenAnswer((_) async => testCountryDetailList);
        return countryBloc;
      },
      act: (bloc) => bloc.add(const SaveCountry(testCountry)),
      expect: () => [const CountriesDoneLoading(testCountryDetailList)],
      verify: (_) {
        verify(mockSaveCountryUseCase(params: testCountry)).called(1);
      });
}
