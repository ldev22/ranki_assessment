import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/widgets/edit_country_form.dart';
import 'package:rank_assessment/injection_container.dart';
import 'package:rank_assessment/routes/routes.dart';

class EditCountry extends HookWidget {
  final CountryEntity country;
  const EditCountry({Key? key, required this.country}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<CountryBloc>()..add(const GetSavedCountries()),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: const Text(
              'Edit Country',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: EditCountryForm(
            country: country,
          ),
        ),
        onGenerateRoute: AppRoutes.onGenerateRoutes,
      ),
    );
  }
}
