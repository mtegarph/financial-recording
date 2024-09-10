import 'package:dio/dio.dart';
import 'package:financial_recording/core/variable/const_variable.dart';
import 'package:financial_recording/features/financial/data/datasources/local/financial_data_source.dart';
import 'package:financial_recording/features/financial/data/repositories/financial_repo_impl.dart';
import 'package:financial_recording/features/financial/domain/repositories/financial_repositories.dart';
import 'package:financial_recording/features/financial/domain/usecases/add_financial.dart';
import 'package:financial_recording/features/financial/domain/usecases/delete_financial.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_balance.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_expenses.dart';
import 'package:financial_recording/features/financial/domain/usecases/get_income.dart';
import 'package:financial_recording/features/financial/domain/usecases/list_financial.dart';
import 'package:financial_recording/features/financial/domain/usecases/update_financial.dart';
import 'package:financial_recording/features/financial/presentation/bloc/add_financial_bloc/add_financial_bloc.dart';
import 'package:financial_recording/features/financial/presentation/bloc/bloc/financial_count_bloc.dart';
import 'package:financial_recording/features/financial/presentation/bloc/get_data_bloc/financial_bloc.dart';
import 'package:financial_recording/features/weather/data/datasources/weather_datasources.dart';
import 'package:financial_recording/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:financial_recording/features/weather/domain/repositories/weather_repository.dart';
import 'package:financial_recording/features/weather/domain/usecases/get_weather.dart';
import 'package:financial_recording/features/weather/presentation/bloc/get_weather_bloc/get_weather_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;
Future<Database> initDatabase() async {
  String path = join(await getDatabasesPath(), 'financial_database.db');
  return await openDatabase(path, version: 1, onCreate: _createDb);
}

Future<void> _createDb(Database db, int version) async {
  await db.execute('''
      CREATE TABLE $tableFinancial (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnDescription TEXT,
        $columnValue TEXT,
        $columnCategory TEXT,
        $columnDate TEXT
      )
    ''');
}

Future<void> init() async {
  //dio
  sl.registerSingleton<Dio>(Dio());

  //sqflite
  final database = await initDatabase();
  sl.registerLazySingleton<Database>(() => database);
  // data source
  sl.registerLazySingleton<FinancialDataSource>(
      () => FinancialDataSource(database: sl()));
  sl.registerLazySingleton<WeatherApiService>(
      () => WeatherApiServiceImpl(dio: sl()));
  // repository
  sl.registerLazySingleton<FinancialRepositories>(
    () => FinancialRepoImpl(financialDataSource: sl()),
  );
  sl.registerLazySingleton<WeatherRepository>(
    () => WeatherRepositoryImpl(weatherRemoteDataSource: sl()),
  );
  // usecase
  sl.registerLazySingleton(
      () => ListFinancialUseCase(financialRepositories: sl()));
  sl.registerLazySingleton(
      () => AddFinancialUsecase(financialRepositories: sl()));
  sl.registerLazySingleton(
      () => GetBalanceUseCase(financialRepositories: sl()));
  sl.registerLazySingleton(
      () => GetExpensesUseCase(financialRepositories: sl()));
  sl.registerLazySingleton(() => GetIncomeUseCase(financialRepositories: sl()));
  sl.registerLazySingleton(
      () => DeleteFinancialUsecase(financialRepositories: sl()));
  sl.registerLazySingleton(
      () => UpdateFinancialUsecase(financialRepositories: sl()));
  sl.registerLazySingleton(() => GetWeatherUseCase(weatherRepository: sl()));

  // bloc
  sl.registerFactory(() => FinancialBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory(() => AddFinancialBloc(sl(), sl(), sl()));
  sl.registerFactory(() => FinancialCountBloc(sl(), sl(), sl()));
  sl.registerFactory(() => GetWeatherBloc(sl()));
}
