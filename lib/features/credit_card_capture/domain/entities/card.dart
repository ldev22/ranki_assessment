import 'package:equatable/equatable.dart';

class CardEntity extends Equatable {
  final String cardHolder;
  final int cardNumber;
  final int cvv;
  final String cardType;
  final String country;

  const CardEntity({
    required this.cardHolder,
    required this.cardNumber,
    required this.cvv,
    required this.cardType,
    required this.country,
  });

  @override
  List<Object?> get props => [
        cardHolder,
        cardNumber,
        cvv,
        cardType,
        country,
      ];
}
