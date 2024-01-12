import 'package:equatable/equatable.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';

abstract class CountryEvent extends Equatable {
  final CountryEntity? country;

  const CountryEvent({this.country});

  @override
  List<Object?> get props => [country!];
}

class GetSavedCountries extends CountryEvent {
  const GetSavedCountries();
}

class SaveCountry extends CountryEvent {
  const SaveCountry(CountryEntity country) : super(country: country);
}

class UpdateCountry extends CountryEvent {
  const UpdateCountry(CountryEntity country) : super(country: country);
}
