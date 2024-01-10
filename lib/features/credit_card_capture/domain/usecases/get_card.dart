import 'package:rank_assessment/core/usecases/usecast.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/card_repository.dart';

class GetCardUseCase implements UseCase<List<CardEntity>, void> {
  final CardRepository _cardRepository;

  GetCardUseCase(this._cardRepository);

  @override
  Future<List<CardEntity>> call({void params}) {
    return _cardRepository.getSavedCards();
  }
}
