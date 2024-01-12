import 'package:flutter/material.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/widgets/credit_card_list_view.dart';

class CreditCardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Credit Card Capture',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blue,
          actions: [
            GestureDetector(
              onTap: () => _onAddCreditCardPressed(context),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ]),
      body: CreditCardListView(),
    );
  }

  void _onAddCreditCardPressed(BuildContext context) {
    Navigator.pushNamed(context, '/AddCreditCard');
  }
}
