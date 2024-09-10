import 'package:dartz/dartz.dart';
import 'package:financial_recording/core/error/failure.dart';
import 'package:financial_recording/features/weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, GetWeatherEntity>> getWeather(
    double latitude,
    double longitude,
  );
}
