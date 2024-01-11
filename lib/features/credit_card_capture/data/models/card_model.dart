import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:floor/floor.dart';

@Entity(tableName: 'cards', primaryKeys: ['id'])
class CardModel extends CardEntity {
  const CardModel({
    required int id,
    required String cardHolder,
    required int cardNumber,
    required String cardType,
    required String country,
    required int cvv,
  }) : super(
            id: id,
            cardHolder: cardHolder,
            cardNumber: cardNumber,
            cardType: cardType,
            country: country,
            cvv: cvv);

  factory CardModel.fromEntity(CardEntity card) {
    return CardModel(
      id: card.id,
      cardHolder: card.cardHolder,
      cardNumber: card.cardNumber,
      cardType: card.cardType,
      country: card.country,
      cvv: card.cvv,
    );
  }
}
