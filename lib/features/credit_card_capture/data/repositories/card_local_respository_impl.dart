import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/card_model.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/card_repository.dart';

class CardLocalRepositoryImpl extends CardRepository {
  final AppDatabase? appDatabase;
  CardLocalRepositoryImpl({required this.appDatabase});

  @override
  Future<List<CardModel>> getSavedCards() async {
    return appDatabase!.cardDao.getSavedCards();
  }

  @override
  Future<void> saveCard(CardEntity card) async {
    await appDatabase!.cardDao.insertCard(CardModel.fromEntity(card));
  }
}
