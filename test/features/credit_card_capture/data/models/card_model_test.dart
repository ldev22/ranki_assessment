import 'package:flutter_test/flutter_test.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/card_model.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';

const testCardModel = CardModel(
    id: 1,
    cardHolder: 'Peter Pan',
    cardNumber: 1234567898765432,
    cardType: 'American Express',
    country: 'USA',
    cvv: 1234);
void main() {
  test('should be a subclass of card entity', () async {
    expect(testCardModel, isA<CardEntity>());
  });

  test('should return a valid card model from the card entity', () async {
    final result = CardModel.fromEntity(testCardModel);

    expect(result, equals(testCardModel));
  });
}
