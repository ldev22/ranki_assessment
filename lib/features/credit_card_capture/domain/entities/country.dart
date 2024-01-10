import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final String countryName;
  final int isBanned;

  const CountryEntity({
    required this.countryName,
    required this.isBanned,
  });

  @override
  List<Object?> get props => [countryName, isBanned];
}
