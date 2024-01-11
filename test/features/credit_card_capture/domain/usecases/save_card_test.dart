import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_card.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SaveCardUseCase saveCardUseCase;
  late MockCardRepository mockCardRepository;

  setUp(() {
    mockCardRepository = MockCardRepository();
    saveCardUseCase = SaveCardUseCase(mockCardRepository);
  });
  const testCardEntity = CardEntity(
    id: 1,
    cardHolder: 'James Test',
    cardNumber: 4574487405351667,
    cvv: 1234,
    cardType: 'Visa',
    country: 'South Africa',
  );
  test('should be able to save a card', () async {
    await saveCardUseCase.call(params: testCardEntity);

    verify(mockCardRepository.saveCard(testCardEntity)).called(1);
  });
}
