// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetWeatherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double latitude, double longitude) getWeather,
    required TResult Function() getLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double latitude, double longitude)? getWeather,
    TResult? Function()? getLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double latitude, double longitude)? getWeather,
    TResult Function()? getLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetWeather value) getWeather,
    required TResult Function(_GetLocation value) getLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetWeather value)? getWeather,
    TResult? Function(_GetLocation value)? getLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetWeather value)? getWeather,
    TResult Function(_GetLocation value)? getLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWeatherEventCopyWith<$Res> {
  factory $GetWeatherEventCopyWith(
          GetWeatherEvent value, $Res Function(GetWeatherEvent) then) =
      _$GetWeatherEventCopyWithImpl<$Res, GetWeatherEvent>;
}

/// @nodoc
class _$GetWeatherEventCopyWithImpl<$Res, $Val extends GetWeatherEvent>
    implements $GetWeatherEventCopyWith<$Res> {
  _$GetWeatherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GetWeatherEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GetWeatherEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double latitude, double longitude) getWeather,
    required TResult Function() getLocation,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double latitude, double longitude)? getWeather,
    TResult? Function()? getLocation,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double latitude, double longitude)? getWeather,
    TResult Function()? getLocation,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetWeather value) getWeather,
    required TResult Function(_GetLocation value) getLocation,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetWeather value)? getWeather,
    TResult? Function(_GetLocation value)? getLocation,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetWeather value)? getWeather,
    TResult Function(_GetLocation value)? getLocation,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetWeatherEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetWeatherImplCopyWith<$Res> {
  factory _$$GetWeatherImplCopyWith(
          _$GetWeatherImpl value, $Res Function(_$GetWeatherImpl) then) =
      __$$GetWeatherImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double latitude, double longitude});
}

/// @nodoc
class __$$GetWeatherImplCopyWithImpl<$Res>
    extends _$GetWeatherEventCopyWithImpl<$Res, _$GetWeatherImpl>
    implements _$$GetWeatherImplCopyWith<$Res> {
  __$$GetWeatherImplCopyWithImpl(
      _$GetWeatherImpl _value, $Res Function(_$GetWeatherImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$GetWeatherImpl(
      null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$GetWeatherImpl implements _GetWeather {
  const _$GetWeatherImpl(this.latitude, this.longitude);

  @override
  final double latitude;
  @override
  final double longitude;

  @override
  String toString() {
    return 'GetWeatherEvent.getWeather(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWeatherImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWeatherImplCopyWith<_$GetWeatherImpl> get copyWith =>
      __$$GetWeatherImplCopyWithImpl<_$GetWeatherImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double latitude, double longitude) getWeather,
    required TResult Function() getLocation,
  }) {
    return getWeather(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double latitude, double longitude)? getWeather,
    TResult? Function()? getLocation,
  }) {
    return getWeather?.call(latitude, longitude);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double latitude, double longitude)? getWeather,
    TResult Function()? getLocation,
    required TResult orElse(),
  }) {
    if (getWeather != null) {
      return getWeather(latitude, longitude);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetWeather value) getWeather,
    required TResult Function(_GetLocation value) getLocation,
  }) {
    return getWeather(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetWeather value)? getWeather,
    TResult? Function(_GetLocation value)? getLocation,
  }) {
    return getWeather?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetWeather value)? getWeather,
    TResult Function(_GetLocation value)? getLocation,
    required TResult orElse(),
  }) {
    if (getWeather != null) {
      return getWeather(this);
    }
    return orElse();
  }
}

abstract class _GetWeather implements GetWeatherEvent {
  const factory _GetWeather(final double latitude, final double longitude) =
      _$GetWeatherImpl;

  double get latitude;
  double get longitude;
  @JsonKey(ignore: true)
  _$$GetWeatherImplCopyWith<_$GetWeatherImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetLocationImplCopyWith<$Res> {
  factory _$$GetLocationImplCopyWith(
          _$GetLocationImpl value, $Res Function(_$GetLocationImpl) then) =
      __$$GetLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetLocationImplCopyWithImpl<$Res>
    extends _$GetWeatherEventCopyWithImpl<$Res, _$GetLocationImpl>
    implements _$$GetLocationImplCopyWith<$Res> {
  __$$GetLocationImplCopyWithImpl(
      _$GetLocationImpl _value, $Res Function(_$GetLocationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetLocationImpl implements _GetLocation {
  const _$GetLocationImpl();

  @override
  String toString() {
    return 'GetWeatherEvent.getLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(double latitude, double longitude) getWeather,
    required TResult Function() getLocation,
  }) {
    return getLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(double latitude, double longitude)? getWeather,
    TResult? Function()? getLocation,
  }) {
    return getLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(double latitude, double longitude)? getWeather,
    TResult Function()? getLocation,
    required TResult orElse(),
  }) {
    if (getLocation != null) {
      return getLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_GetWeather value) getWeather,
    required TResult Function(_GetLocation value) getLocation,
  }) {
    return getLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_GetWeather value)? getWeather,
    TResult? Function(_GetLocation value)? getLocation,
  }) {
    return getLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_GetWeather value)? getWeather,
    TResult Function(_GetLocation value)? getLocation,
    required TResult orElse(),
  }) {
    if (getLocation != null) {
      return getLocation(this);
    }
    return orElse();
  }
}

abstract class _GetLocation implements GetWeatherEvent {
  const factory _GetLocation() = _$GetLocationImpl;
}

/// @nodoc
mixin _$GetWeatherState {
  Option<GetWeatherEntity> get weather => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  String get errorMessage => throw _privateConstructorUsedError;
  String get lat => throw _privateConstructorUsedError;
  String get long => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetWeatherStateCopyWith<GetWeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetWeatherStateCopyWith<$Res> {
  factory $GetWeatherStateCopyWith(
          GetWeatherState value, $Res Function(GetWeatherState) then) =
      _$GetWeatherStateCopyWithImpl<$Res, GetWeatherState>;
  @useResult
  $Res call(
      {Option<GetWeatherEntity> weather,
      bool isLoading,
      bool isError,
      String errorMessage,
      String lat,
      String long});
}

/// @nodoc
class _$GetWeatherStateCopyWithImpl<$Res, $Val extends GetWeatherState>
    implements $GetWeatherStateCopyWith<$Res> {
  _$GetWeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMessage = null,
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_value.copyWith(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Option<GetWeatherEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetWeatherStateImplCopyWith<$Res>
    implements $GetWeatherStateCopyWith<$Res> {
  factory _$$GetWeatherStateImplCopyWith(_$GetWeatherStateImpl value,
          $Res Function(_$GetWeatherStateImpl) then) =
      __$$GetWeatherStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<GetWeatherEntity> weather,
      bool isLoading,
      bool isError,
      String errorMessage,
      String lat,
      String long});
}

/// @nodoc
class __$$GetWeatherStateImplCopyWithImpl<$Res>
    extends _$GetWeatherStateCopyWithImpl<$Res, _$GetWeatherStateImpl>
    implements _$$GetWeatherStateImplCopyWith<$Res> {
  __$$GetWeatherStateImplCopyWithImpl(
      _$GetWeatherStateImpl _value, $Res Function(_$GetWeatherStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weather = null,
    Object? isLoading = null,
    Object? isError = null,
    Object? errorMessage = null,
    Object? lat = null,
    Object? long = null,
  }) {
    return _then(_$GetWeatherStateImpl(
      weather: null == weather
          ? _value.weather
          : weather // ignore: cast_nullable_to_non_nullable
              as Option<GetWeatherEntity>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: null == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lat: null == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as String,
      long: null == long
          ? _value.long
          : long // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetWeatherStateImpl implements _GetWeatherState {
  const _$GetWeatherStateImpl(
      {required this.weather,
      required this.isLoading,
      required this.isError,
      required this.errorMessage,
      required this.lat,
      required this.long});

  @override
  final Option<GetWeatherEntity> weather;
  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final String errorMessage;
  @override
  final String lat;
  @override
  final String long;

  @override
  String toString() {
    return 'GetWeatherState(weather: $weather, isLoading: $isLoading, isError: $isError, errorMessage: $errorMessage, lat: $lat, long: $long)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWeatherStateImpl &&
            (identical(other.weather, weather) || other.weather == weather) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.long, long) || other.long == long));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, weather, isLoading, isError, errorMessage, lat, long);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWeatherStateImplCopyWith<_$GetWeatherStateImpl> get copyWith =>
      __$$GetWeatherStateImplCopyWithImpl<_$GetWeatherStateImpl>(
          this, _$identity);
}

abstract class _GetWeatherState implements GetWeatherState {
  const factory _GetWeatherState(
      {required final Option<GetWeatherEntity> weather,
      required final bool isLoading,
      required final bool isError,
      required final String errorMessage,
      required final String lat,
      required final String long}) = _$GetWeatherStateImpl;

  @override
  Option<GetWeatherEntity> get weather;
  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  String get errorMessage;
  @override
  String get lat;
  @override
  String get long;
  @override
  @JsonKey(ignore: true)
  _$$GetWeatherStateImplCopyWith<_$GetWeatherStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
