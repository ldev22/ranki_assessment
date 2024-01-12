import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/update_country.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_event.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_country.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final GetCountyUseCase _getCountyUseCase;
  final SaveCountryUseCase _saveCountryUseCase;
  final UpdateCountryUseCase _updateCountryUseCase;

  CountryBloc(this._getCountyUseCase, this._saveCountryUseCase,
      this._updateCountryUseCase)
      : super(CountriesEmpty()) {
    on<GetSavedCountries>(onGetSavedCountries);
    on<SaveCountry>(onSaveCountry);
    on<UpdateCountry>(onUpdateCountry);
  }

  void onGetSavedCountries(
      GetSavedCountries event, Emitter<CountryState> emit) async {
    emit(const CountriesLoading());
    final countries = await _getCountyUseCase();
    emit(CountriesDoneLoading(countries));
  }

  void onSaveCountry(
      SaveCountry saveCountry, Emitter<CountryState> emit) async {
    await _saveCountryUseCase(params: saveCountry.country);
    final countries = await _getCountyUseCase();
    emit(CountriesDoneLoading(countries));
  }

  void onUpdateCountry(
      UpdateCountry updateCountry, Emitter<CountryState> emit) async {
    await _updateCountryUseCase(params: updateCountry.country);
    final countries = await _getCountyUseCase();
    emit(CountriesDoneLoading(countries));
  }
}
