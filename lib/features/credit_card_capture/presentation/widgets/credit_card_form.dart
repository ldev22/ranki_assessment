import 'dart:math';

import 'package:credit_card_scanner/credit_card_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rank_assessment/core/constants/constants.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_state.dart';

//using stateful widget here to simplify usage of dropdown state due to time constraints
//and load shedding this week
class CreditCardForm extends StatefulWidget {
  const CreditCardForm({Key? key}) : super(key: key);

  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  String? _selectedCountry;
  final TextEditingController _cardHolderDetailsController =
      TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  CardDetails? cardDetails;
  final CardScanOptions _scanOptions = const CardScanOptions(
    scanCardHolderName: true,
    // enableDebugLogs: true,
    validCardsToScanBeforeFinishingScan: 5,
    possibleCardHolderNamePositions: [
      CardHolderNameScanPosition.aboveCardNumber,
    ],
  );
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Column(
        children: [
          TextField(
            controller: _cardHolderDetailsController,
            decoration: const InputDecoration(labelText: 'CardHolder Details'),
          ),
          const SizedBox(
            height: 5,
          ),
          TextField(
            controller: _cardNumberController,
            decoration: const InputDecoration(labelText: 'Card Number'),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 50,
                child: TextField(
                  controller: _cvvController,
                  decoration: const InputDecoration(labelText: 'CVV'),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: _buildCountries(),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => _onAddCountryPressed(context),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: const Text(
                      'Add Country',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
            onPressed: () async {
              final cardDetails =
                  await CardScanner.scanCard(scanOptions: _scanOptions);
              if (cardDetails == null) return;
              setState(() {
                _cardHolderDetailsController.text = cardDetails.cardHolderName;
                _cardNumberController.text = cardDetails.cardNumber;
                _cvvController.text = '123';
                _selectedCountry = 'South Africa';
              });
            },
            icon: const Icon(Icons.camera),
            label: const Text('Scan Card'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton.icon(
            onPressed: () {
              _onSaveButtonPressed(context);
            },
            icon: const Icon(Icons.save, color: Colors.white),
            label: const Text('Save Card'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountries() {
    return BlocBuilder<CountryBloc, CountryState>(
      builder: (ctx, state) {
        if (state is CountriesEmpty) {
          return const TextField(
            decoration: InputDecoration(labelText: 'Issuing Country'),
          );
        } else if (state is CountriesLoading) {
          return const Expanded(
              child: Center(child: CupertinoActivityIndicator()));
        } else if (state is CountriesDoneLoading) {
          return Expanded(
            child: DropdownButton(
              value: _selectedCountry,
              items: [
                const DropdownMenuItem(
                  value: null,
                  child: Text('Issuing Country'),
                ),
                ...state.countries
                    .map((country) => DropdownMenuItem(
                          value: country.country,
                          child: Text(country.country!),
                        ))
                    .toList(),
              ],
              onChanged: (selectedCountry) {
                setState(() {
                  _selectedCountry = selectedCountry;
                });
              },
            ),
          );
        }
        return Container();
      },
    );
  }

  void _onAddCountryPressed(BuildContext context) {
    Navigator.pushNamed(context, '/AddCountry');
  }

  void _onSaveButtonPressed(BuildContext context) {
    // Retrieve values from TextFields
    final cardHolderDetails = _cardHolderDetailsController.text;
    final cardNumber = int.parse(_cardNumberController.text);
    final cvv = int.parse(_cvvController.text);
    final selectedCountry = _selectedCountry;

    Random random = Random();
    //for storage purposes and time purposes we are generating the id value randomly
    //normally this would auto increment because we would be saving these things to
    //an api
    final id = random.nextInt(10000);
    final cardType = getCardType(cardNumber.toString());

    final creditCardEntity = CardEntity(
      id: id,
      cardHolder: cardHolderDetails,
      cardNumber: cardNumber,
      cvv: cvv,
      country: selectedCountry!,
      cardType: cardType!,
    );

    if (context.read<CardBloc>() != null) {
      BlocProvider.of<CardBloc>(context).add(SaveCard(creditCardEntity));

      Navigator.pushNamed(context, '/CreditCardPage');
    }
    // Navigate to home screen
    Navigator.pushNamed(context, '/CreditCardPage');
  }

  String? getCardType(String cardNumber) {
    // Extract the first digit
    final firstDigit = int.parse(cardNumber.substring(0, 1));

    // Check if the first digit exists in the cardTypes map
    if (cardTypes.containsKey(firstDigit)) {
      return cardTypes[firstDigit];
    } else {
      return 'Unknown Card Type'; // Handle unknown card types
    }
  }
}
