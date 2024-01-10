import 'package:rank_assessment/core/usecases/usecast.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/card_repository.dart';

class SaveCardUseCase implements UseCase<void, CardEntity> {
  final CardRepository _cardRepository;

  SaveCardUseCase(this._cardRepository);

  @override
  Future<void> call({CardEntity? params}) {
    return _cardRepository.saveCard(params!);
  }
}
