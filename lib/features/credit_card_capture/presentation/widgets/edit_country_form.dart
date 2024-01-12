import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_event.dart';

class EditCountryForm extends StatefulWidget {
  final CountryEntity? country;
  const EditCountryForm({Key? key, this.country}) : super(key: key);

  @override
  _EditCountryFormState createState() => _EditCountryFormState();
}

class _EditCountryFormState extends State<EditCountryForm> {
  bool isCountryBanned = false;
  TextEditingController countryNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Set the initial value for the TextField
    countryNameController.text = widget.country?.country ?? '';
    // Set the initial value for the Checkbox
    isCountryBanned = widget.country?.isBanned == 1;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: countryNameController,
            decoration: const InputDecoration(labelText: 'Country'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        CheckboxListTile(
          title: const Text('Banned Country'),
          value: isCountryBanned,
          onChanged: (value) {
            // Handle the checkbox state change
            setState(() {
              isCountryBanned = value!;
            });
          },
        ),
        const SizedBox(
          height: 5,
        ),
        ElevatedButton.icon(
          onPressed: () {
            _onSaveButtonPressed(context, widget.country!);
          },
          icon: const Icon(Icons.save, color: Colors.white),
          label: const Text('Update Country'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  void _onSaveButtonPressed(
      BuildContext context, CountryEntity existingCountry) {
    final countryName = countryNameController.text;
    final isCountryBannedValue = isCountryBanned ? 1 : 0;

    // Create an updated CountryEntity with existing id and updated values
    final updatedCountry = CountryEntity(
      id: existingCountry.id,
      country: countryName,
      isBanned: isCountryBannedValue,
    );

    BlocProvider.of<CountryBloc>(context).add(UpdateCountry(updatedCountry));

    Navigator.pushNamed(context, '/AddCreditCard');
  }
}
