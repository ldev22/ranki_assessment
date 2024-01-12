import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_card.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_state.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  final GetCardUseCase _getCardUseCase;
  final SaveCardUseCase _saveCardUseCase;

  CardBloc(this._getCardUseCase, this._saveCardUseCase) : super(CardsEmpty()) {
    on<GetSavedCards>(onGetSavedCards);
    on<SaveCard>(onSaveCard);
  }

  void onGetSavedCards(GetSavedCards event, Emitter<CardState> emit) async {
    emit(const CardsLoading());
    final cards = await _getCardUseCase();
    emit(CardsDoneLoading(cards));
  }

  void onSaveCard(SaveCard saveCard, Emitter<CardState> emit) async {
    await _saveCardUseCase(params: saveCard.card);
    final cards = await _getCardUseCase();
    emit(CardsDoneLoading(cards));
  }
}
