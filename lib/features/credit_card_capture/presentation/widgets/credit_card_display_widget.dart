import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CreditCardDisplayWidget extends StatelessWidget {
  final String cardNumber;
  final String expiryDate;
  final String cardHolderName;
  final String cvvCode;

  CreditCardDisplayWidget({
    required this.cardNumber,
    required this.expiryDate,
    required this.cardHolderName,
    required this.cvvCode,
  });

  @override
  Widget build(BuildContext context) {
    return CreditCardWidget(
      showBackView: false,
      // Pass the credit card data to CreditCardWidget
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      bankName: 'Bank of the Universe',
      obscureCardNumber: false,
      obscureCardCvv: false,
      isHolderNameVisible: true,
      cardBgColor: Colors.blue, // You can customize the card background color
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
      customCardTypeIcons: <CustomCardTypeIcon>[
        CustomCardTypeIcon(
          cardType:
              CardType.mastercard, // You can customize this based on card type
          cardImage: Image.asset(
            'assets/mastercard.png',
            height: 48,
            width: 48,
          ),
        ),
      ],
    );
  }
}
