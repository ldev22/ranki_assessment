import 'package:mockito/mockito.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_card.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCardUseCase getCardUseCase;
  late MockCardRepository mockCardRepository;

  setUp(() {
    mockCardRepository = MockCardRepository();
    getCardUseCase = GetCardUseCase(mockCardRepository);
  });

  const testCardDetailList = [
    CardEntity(
      cardHolder: 'James Test',
      cardNumber: 4574487405351667,
      cvv: 1234,
      cardType: 'Visa',
      country: 'South Africa',
    ),
    CardEntity(
      cardHolder: 'Peter Pan',
      cardNumber: 4874053516674574,
      cvv: 1234,
      cardType: 'Visa',
      country: 'South Africa',
    )
  ];

  test('should get card details from the repository', () async {
    when(mockCardRepository.getSavedCards())
        .thenAnswer((_) async => testCardDetailList);

    final result = await getCardUseCase.call();

    expect(result, testCardDetailList);
  });
}
