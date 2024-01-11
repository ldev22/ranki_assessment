import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final int id;
  final String country;
  final int isBanned;

  const CountryEntity({
    required this.id,
    required this.country,
    required this.isBanned,
  });

  @override
  List<Object?> get props => [id, country, isBanned];
}
