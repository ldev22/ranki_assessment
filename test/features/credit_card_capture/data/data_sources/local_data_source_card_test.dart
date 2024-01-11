import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/card_local_data_source.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/card_model.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockAppDatabase mockAppDatabase;
  late CardLocalDataSourceImpl cardLocalDataSourceImpl;
  late MockCardDao mockCardDao;
  setUp(() {
    mockCardDao = MockCardDao();
    mockAppDatabase = MockAppDatabase();
    cardLocalDataSourceImpl =
        CardLocalDataSourceImpl(appDatabase: mockAppDatabase);
  });

  const testCardModel = CardModel(
    id: 1,
    cardHolder: 'Peter Pan',
    cardNumber: 4574487405251567,
    cardType: 'Visa',
    country: 'South Africa',
    cvv: 123,
  );

  const testCardDetailList = [
    CardModel(
      id: 1,
      cardHolder: 'James Test',
      cardNumber: 4574487405351667,
      cvv: 1234,
      cardType: 'Visa',
      country: 'South Africa',
    ),
    CardModel(
      id: 2,
      cardHolder: 'Peter Pan',
      cardNumber: 4874053516674574,
      cvv: 1234,
      cardType: 'Visa',
      country: 'Namibia',
    )
  ];

  group('Database card tests', () {
    test('get credit cards from database', () async {
      when(mockAppDatabase.cardDao).thenReturn(mockCardDao);
      when(mockCardDao.getSavedCards())
          .thenAnswer((_) async => testCardDetailList);

      final result = await cardLocalDataSourceImpl.getSavedCards();

      expect(result, testCardDetailList);
    });

    test('save a card to the database', () async {
      when(mockAppDatabase.cardDao).thenReturn(mockCardDao);

      await cardLocalDataSourceImpl.insertCard(testCardModel);

      verify(mockCardDao.insertCard(testCardModel)).called(1);
    });
  });
}
