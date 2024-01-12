import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_state.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetCardUseCase mockGetCardUseCase;
  late MockSaveCardUseCase mockSaveCardUseCase;
  late CardBloc cardBloc;

  setUp(() {
    mockGetCardUseCase = MockGetCardUseCase();
    mockSaveCardUseCase = MockSaveCardUseCase();
    cardBloc = CardBloc(mockGetCardUseCase, mockSaveCardUseCase);
  });

  const testCardDetailList = [
    CardEntity(
      id: 1,
      cardHolder: 'James Test',
      cardNumber: 4574487405351667,
      cvv: 1234,
      cardType: 'Visa',
      country: 'South Africa',
    ),
    CardEntity(
      id: 2,
      cardHolder: 'Peter Pan',
      cardNumber: 4874053516674574,
      cvv: 1234,
      cardType: 'Visa',
      country: 'Namibia',
    )
  ];

  const testCard = CardEntity(
    id: 2,
    cardHolder: 'Peter Pan',
    cardNumber: 4874053516674574,
    cvv: 1234,
    cardType: 'Visa',
    country: 'Namibia',
  );

  blocTest<CardBloc, CardState>(
    'should emit [CardsLoading, CardsDoneLoading] when GetSavedCards is added',
    build: () {
      when(mockGetCardUseCase()).thenAnswer((_) async => testCardDetailList);
      return cardBloc;
    },
    act: (bloc) async {
      bloc.add(const GetSavedCards());
    },
    expect: () => [
      const CardsLoading(),
      const CardsDoneLoading(testCardDetailList),
    ],
  );

  blocTest<CardBloc, CardState>(
      'calls saveCard usecase and should emit [CardsDoneLoading] when SaveCard is added',
      build: () {
        when(mockSaveCardUseCase(params: testCard)).thenAnswer((_) async => {});
        when(mockGetCardUseCase()).thenAnswer((_) async => testCardDetailList);
        return cardBloc;
      },
      act: (bloc) => bloc.add(const SaveCard(testCard)),
      expect: () => [const CardsDoneLoading(testCardDetailList)],
      verify: (_) {
        verify(mockSaveCardUseCase(params: testCard)).called(1);
      });
}
