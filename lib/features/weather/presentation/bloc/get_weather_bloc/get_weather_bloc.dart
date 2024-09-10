import 'package:dartz/dartz.dart';
import 'package:financial_recording/features/weather/domain/entities/weather_entity.dart';
import 'package:financial_recording/features/weather/domain/usecases/get_weather.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'get_weather_event.dart';
part 'get_weather_state.dart';
part 'get_weather_bloc.freezed.dart';

class GetWeatherBloc extends Bloc<GetWeatherEvent, GetWeatherState> {
  final GetWeatherUseCase getWeatherUseCase;
  GetWeatherBloc(this.getWeatherUseCase) : super(GetWeatherState.initial()) {
    on<_GetWeather>(_getWeather);
    on<_GetLocation>(_getLocation);
  }
  Future<void> _getLocation(
      _GetLocation event, Emitter<GetWeatherState> emit) async {
    bool serviceEnabled;
    LocationPermission permission;
    debugPrint('Masuk Pak Haji');
    emit(state.copyWith(isLoading: true));
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    Position position =
        await Geolocator.getCurrentPosition(locationSettings: locationSettings);

    emit(state.copyWith(
      lat: position.latitude.toString(),
      long: position.longitude.toString(),
      isLoading: false,
    ));
    add(_GetWeather(double.parse(state.lat), double.parse(state.long)));
  }

  void _getWeather(_GetWeather event, Emitter<GetWeatherState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await getWeatherUseCase
        .call(params: (lang: event.latitude, long: event.longitude));
    result.fold(
      (failure) => emit(state.copyWith(
        isLoading: false,
        isError: true,
        errorMessage: failure.message,
      )),
      (weatherEntity) => emit(state.copyWith(
        isLoading: false,
        isError: false,
        weather: Some(weatherEntity),
      )),
    );
  }
}
