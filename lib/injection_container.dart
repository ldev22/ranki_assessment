import 'package:get_it/get_it.dart';
import 'package:rank_assessment/features/credit_card_capture/data/data_sources/app_database.dart';
import 'package:rank_assessment/features/credit_card_capture/data/repositories/card_local_respository_impl.dart';
import 'package:rank_assessment/features/credit_card_capture/data/repositories/country_local_repository_impl.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/entities/card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/card_repository.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/repositories/country_repository.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/get_country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_card.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/save_country.dart';
import 'package:rank_assessment/features/credit_card_capture/domain/usecases/update_country.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/card_bloc.dart';
import 'package:rank_assessment/features/credit_card_capture/presentation/bloc/country_bloc.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  locator.registerSingleton<AppDatabase>(database);

  //usecases
  locator.registerLazySingleton(() => GetCardUseCase(locator()));
  locator.registerLazySingleton(() => SaveCardUseCase(locator()));
  locator.registerLazySingleton(() => GetCountyUseCase(locator()));
  locator.registerLazySingleton(() => SaveCountryUseCase(locator()));
  locator.registerLazySingleton(() => UpdateCountryUseCase(locator()));

  //repositories
  locator.registerLazySingleton<CardRepository>(
      () => CardLocalRepositoryImpl(appDatabase: locator()));
  locator.registerLazySingleton<CountryRepository>(
      () => CountryLocalRepositoryImpl(appDatabase: locator()));

  //blocs
  locator.registerFactory(() => CardBloc(locator(), locator()));
  locator.registerFactory(() => CountryBloc(locator(), locator(), locator()));
}
