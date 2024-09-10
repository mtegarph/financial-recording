part of 'get_weather_bloc.dart';

@freezed
class GetWeatherState with _$GetWeatherState {
  const factory GetWeatherState({
    required Option<GetWeatherEntity> weather,
    required bool isLoading,
    required bool isError,
    required String errorMessage,
    required String lat,
    required String long,
    double? temp,
  }) = _GetWeatherState;
  factory GetWeatherState.initial() => const GetWeatherState(
      weather: None(),
      isLoading: true,
      isError: false,
      errorMessage: '',
      lat: '',
      long: '');
}
