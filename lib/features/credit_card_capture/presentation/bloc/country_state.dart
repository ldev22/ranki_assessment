import 'package:equatable/equatable.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';

abstract class CountryState extends Equatable {
  final List<CountryEntity> countries;
  final String? selectedCountry;
  const CountryState({this.countries = const [], this.selectedCountry});

  @override
  List<Object?> get props => [countries, selectedCountry];
}

class CountriesEmpty extends CountryState {}

class CountriesLoading extends CountryState {
  const CountriesLoading();
}

class CountriesDoneLoading extends CountryState {
  const CountriesDoneLoading(List<CountryEntity> countries)
      : super(countries: countries);
}

class CountryUpdated extends CountryState {
  const CountryUpdated(String selectedCountry)
      : super(selectedCountry: selectedCountry);
}
