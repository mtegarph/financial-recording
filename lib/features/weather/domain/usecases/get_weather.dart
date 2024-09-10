import 'package:dartz/dartz.dart';
import 'package:financial_recording/core/error/failure.dart';
import 'package:financial_recording/core/usecase/usecase.dart';
import 'package:financial_recording/features/weather/domain/entities/weather_entity.dart';
import 'package:financial_recording/features/weather/domain/repositories/weather_repository.dart';

class GetWeatherUseCase extends UseCase<Either<Failure, GetWeatherEntity>,
    ({double long, double lang})> {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase({required this.weatherRepository});
  @override
  Future<Either<Failure, GetWeatherEntity>> call(
      {({double lang, double long})? params}) {
    return weatherRepository.getWeather(params!.lang, params.long);
  }
}
