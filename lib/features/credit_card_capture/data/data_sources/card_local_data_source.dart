import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/card_model.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';

abstract class CardLocalDataSource {
  Future<List<CardModel>> getSavedCards();

  Future<void> insertCard(CardModel card);
}
