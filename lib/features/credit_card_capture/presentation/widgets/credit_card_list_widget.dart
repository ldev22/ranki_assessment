import 'package:flutter/material.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/widgets/credit_card_display_widget.dart';

class CreditCardListWidget extends StatelessWidget {
  final List<CardEntity> creditCards;

  const CreditCardListWidget({super.key, required this.creditCards});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: creditCards.length,
      itemBuilder: (context, index) {
        final creditCard = creditCards[index];
        return CreditCardDisplayWidget(
          cardNumber: creditCard.cardNumber.toString(),
          cardHolderName: creditCard.cardHolder,
          expiryDate: '12/2024',
          cvvCode: creditCard.cvv.toString(),
        );
      },
    );
  }
}
