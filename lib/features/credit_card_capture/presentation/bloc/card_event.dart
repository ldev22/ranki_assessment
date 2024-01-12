import 'package:equatable/equatable.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';

abstract class CardEvent extends Equatable {
  final CardEntity? card;

  const CardEvent({this.card});

  @override
  List<Object?> get props => [card!];
}

class GetSavedCards extends CardEvent {
  const GetSavedCards();
}

class SaveCard extends CardEvent {
  const SaveCard(CardEntity card) : super(card: card);
}
