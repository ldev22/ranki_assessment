import 'package:floor/floor.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/card_model.dart';

@dao
abstract class CardDao {
  @Insert()
  Future<void> insertCard(CardModel card);

  @Query(
      'SELECT * FROM cards JOIN countries ON cards.country = countries.country WHERE countries.is_banned = 0')
  Future<List<CardModel>> getSavedCards();
}
