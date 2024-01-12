import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_state.dart';
import 'package:rank_assessment/injection_container.dart';

//use a staeful widget in this instance because the banned check box should be clickable
class CountryForm extends StatefulWidget {
  const CountryForm({Key? key}) : super(key: key);

  @override
  _CountryFormState createState() => _CountryFormState();
}

class _CountryFormState extends State<CountryForm> {
  bool _isCountryBanned = false;
  final TextEditingController _countryNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _countryNameController,
            decoration: const InputDecoration(labelText: 'Country'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CheckboxListTile(
          title: const Text('Banned Country'),
          value: _isCountryBanned,
          onChanged: (value) {
            // Handle the checkbox state change
            setState(() {
              _isCountryBanned = value!;
            });
          },
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton.icon(
          onPressed: () {
            _onSaveButtonPressed(context);
          },
          icon: const Icon(Icons.save, color: Colors.white),
          label: const Text('Save Country'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          child: Expanded(
            child: _buildCountryList(),
          ),
        ),
      ],
    );
  }

  Widget _buildCountryList() {
    return BlocBuilder<CountryBloc, CountryState>(builder: (ctx, state) {
      if (state is CountriesEmpty) {
        return const Text(
          'No Countries in storage',
          style: TextStyle(color: Colors.red),
        );
      } else if (state is CountriesLoading) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (state is CountriesDoneLoading) {
        return DataTable(
          columns: const [
            DataColumn(label: Text('Country Name')),
            DataColumn(label: Text('Banned')),
            DataColumn(label: Text('Edit Country')),
          ],
          rows: state.countries.map<DataRow>((country) {
            return DataRow(
              cells: [
                DataCell(Text(country.country!)),
                DataCell(country.isBanned == 1
                    ? const Text('Banned')
                    : const Text('Permitted')),
                DataCell(
                  TextButton(
                    onPressed: () {
                      _onEditCountryPressed(context, country);
                    },
                    child: const Text('Configure'),
                  ),
                ),
              ],
            );
          }).toList(),
        );
      }
      return Container();
    });
  }

  void _onSaveButtonPressed(BuildContext context) {
    final countrName = _countryNameController.text;
    final isCountryBannedValue = _isCountryBanned ? 1 : 0;
    Random random = Random();
    //for storage purposes and time purposes we are generating the id value randomly
    //normally this would auto increment because we would be saving these things to
    //an api
    final id = random.nextInt(10000);
    final countryEntity = CountryEntity(
        id: id, country: countrName, isBanned: isCountryBannedValue);
    if (context.read<CountryBloc>() != null) {
      BlocProvider.of<CountryBloc>(context).add(SaveCountry(countryEntity));

      Navigator.pushNamed(context, '/AddCreditCard');
    }
  }

  void _onEditCountryPressed(BuildContext context, CountryEntity country) {
    Navigator.pushNamed(context, '/EditCountry', arguments: country);
  }
}
