import 'package:financial_recording/features/weather/data/models/weather_model.dart';
import 'package:financial_recording/features/weather/domain/entities/weather_entity.dart';

class WeatherMapper {
  GetWeatherEntity toEntity(GetWeatherModel model) {
    return GetWeatherEntity(
        elevation: model.elevation,
        generationtimeMs: model.generationtimeMs,
        latitude: model.latitude,
        longitude: model.longitude,
        timezone: model.timezone,
        timezoneAbbreviation: model.timezoneAbbreviation,
        utcOffsetSeconds: model.utcOffsetSeconds,
        currentWeather: CurrentWeather(
          temperature: model.currentWeather?.temperature,
          windspeed: model.currentWeather?.windspeed,
          winddirection: model.currentWeather?.winddirection,
          weathercode: model.currentWeather?.weathercode,
          time: model.currentWeather?.time,
        ),
        currentWeatherUnits: CurrentWeatherUnits(
          time: model.currentWeatherUnits?.time,
          winddirection: model.currentWeatherUnits?.winddirection,
          windspeed: model.currentWeatherUnits?.windspeed,
          temperature: model.currentWeatherUnits?.temperature,
          weathercode: model.currentWeatherUnits?.weathercode,
        ));
  }
}
