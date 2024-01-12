import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_state.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/widgets/credit_card_list_widget.dart';

class CreditCardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final creditCardBloc = context.read<CardBloc>();
    creditCardBloc.add(const GetSavedCards());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Credit Cards"),
      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state is CardsDoneLoading) {
            // Pass the list of credit cards to CreditCardListWidget
            return CreditCardListWidget(creditCards: state.cards);
          } else if (state is CardsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("Error loading credit cards"));
          }
        },
      ),
    );
  }
}
