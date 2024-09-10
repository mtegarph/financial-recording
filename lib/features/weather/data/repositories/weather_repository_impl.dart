import 'package:dartz/dartz.dart';
import 'package:financial_recording/core/error/exception.dart';
import 'package:financial_recording/core/error/failure.dart';
import 'package:financial_recording/features/weather/data/datasources/weather_datasources.dart';
import 'package:financial_recording/features/weather/data/mapper/weather_mapper.dart';
import 'package:financial_recording/features/weather/domain/entities/weather_entity.dart';
import 'package:financial_recording/features/weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherApiService weatherRemoteDataSource;
  WeatherRepositoryImpl({required this.weatherRemoteDataSource});
  @override
  Future<Either<Failure, GetWeatherEntity>> getWeather(
      double latitude, double longitude) async {
    try {
      final result = await weatherRemoteDataSource.getWeather(
          latitude.toString(), longitude.toString());
      final GetWeatherEntity model = WeatherMapper().toEntity(result);
      return Right(model);
    } on ServerException {
      return const Left(ServerFailure('kesalahan di server'));
    }
  }
}
