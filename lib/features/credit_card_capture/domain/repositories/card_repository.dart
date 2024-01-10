import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';

abstract class CardRepository {
  Future<List<CardEntity>> getSavedCards();

  Future<void> saveCard(CardEntity cardEntity);
}
