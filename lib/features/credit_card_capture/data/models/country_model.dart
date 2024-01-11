import 'package:floor/floor.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/country.dart';

@Entity(tableName: 'countries', primaryKeys: ['id'])
class CountryModel extends CountryEntity {
  const CountryModel(
      {required int id, required String country, required int isBanned})
      : super(id: id, country: country, isBanned: isBanned);

  factory CountryModel.fromEntity(CountryEntity country) {
    return CountryModel(
        id: country.id, country: country.country, isBanned: country.isBanned);
  }
}
