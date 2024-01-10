import 'package:rank_assessment/core/usecases/usecast.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/country_repository.dart';

class GetCountyUseCase implements UseCase<List<CountryEntity>, void> {
  final CountryRepository _countryRepository;

  GetCountyUseCase(this._countryRepository);

  @override
  Future<List<CountryEntity>> call({void params}) {
    return _countryRepository.getCountries();
  }
}
