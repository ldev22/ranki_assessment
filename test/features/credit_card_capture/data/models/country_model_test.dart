import 'package:flutter_test/flutter_test.dart';
import 'package:rank_assessment/features/credit_card_capture/data/models/country_model.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';

const testCountryModel =
    CountryModel(id: 1, country: 'South Africa', isBanned: 0);
void main() {
  test('should be a subclass of country entity', () async {
    expect(testCountryModel, isA<CountryEntity>());
  });

  test('should return a valid country model from the country entity', () async {
    final result = CountryModel.fromEntity(testCountryModel);

    expect(result, equals(testCountryModel));
  });
}
