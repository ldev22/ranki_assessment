import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/widgets/credit_card_form.dart';
import 'package:rank_assessment/injection_container.dart';
import 'package:rank_assessment/routes/routes.dart';

class AddCreditCard extends HookWidget {
  const AddCreditCard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CardBloc>(
          create: (_) => locator<CardBloc>()..add(const GetSavedCards()),
        ),
        BlocProvider<CountryBloc>(
          create: (_) => locator<CountryBloc>()..add(const GetSavedCountries()),
        ),
      ],
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Add New Credit Card',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: const CreditCardForm(),
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
