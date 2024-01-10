import 'package:rank_assessment/core/usecases/usecast.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/country_repository.dart';

class SaveCountryUseCase implements UseCase<void, CountryEntity> {
  final CountryRepository _countryRepository;

  SaveCountryUseCase(this._countryRepository);
  @override
  Future<void> call({CountryEntity? params}) {
    return _countryRepository.saveCountry(params!);
  }
}
