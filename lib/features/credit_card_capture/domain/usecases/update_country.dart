import 'package:rank_assessment/core/usecases/usecast.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/country_repository.dart';

class UpdateCountryUseCase implements UseCase<void, CountryEntity> {
  final CountryRepository _countryRepository;

  UpdateCountryUseCase(this._countryRepository);
  @override
  Future<void> call({CountryEntity? params}) {
    return _countryRepository.updateCountry(params!);
  }
}
