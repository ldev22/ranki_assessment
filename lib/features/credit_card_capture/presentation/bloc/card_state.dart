import 'package:equatable/equatable.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';

abstract class CardState extends Equatable {
  final List<CardEntity> cards;

  const CardState({this.cards = const []});

  @override
  List<Object?> get props => [cards];
}

class CardsEmpty extends CardState {}

class CardsLoading extends CardState {
  const CardsLoading();
}

class CardsDoneLoading extends CardState {
  const CardsDoneLoading(List<CardEntity> cards) : super(cards: cards);
}
