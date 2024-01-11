import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/card_model.dart';

abstract class CardLocalDataSource {
  Future<List<CardModel>> getSavedCards();

  Future<void> insertCard(CardModel card);
}

class CardLocalDataSourceImpl extends CardLocalDataSource {
  final AppDatabase appDatabase;
  CardLocalDataSourceImpl({required this.appDatabase});

  @override
  Future<List<CardModel>> getSavedCards() {
    return appDatabase.cardDao.getSavedCards();
  }

  @override
  Future<void> insertCard(CardModel card) async {
    await appDatabase.cardDao.insertCard(card);
  }
}
