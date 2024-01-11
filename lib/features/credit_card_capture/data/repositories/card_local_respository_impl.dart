import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/card_local_data_source.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/card_model.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';

class CardLocalRepositoryImpl extends CardLocalDataSource {
  final AppDatabase appDatabase;
  CardLocalRepositoryImpl({required this.appDatabase});

  @override
  Future<List<CardModel>> getSavedCards() async {
    return appDatabase.cardDao.getSavedCards();
  }

  @override
  Future<void> insertCard(CardEntity card) async {
    await appDatabase.cardDao.insertCard(CardModel.fromEntity(card));
  }
}
