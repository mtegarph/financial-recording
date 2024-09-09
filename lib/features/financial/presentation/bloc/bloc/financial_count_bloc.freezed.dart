// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'financial_count_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FinancialCountEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String description, String value, String category)
        addData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        updateData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        deleteData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String description, String value, String category)?
        addData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? deleteData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String description, String value, String category)?
        addData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? deleteData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_DeleteData value) deleteData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_DeleteData value)? deleteData,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddData value)? addData,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_DeleteData value)? deleteData,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialCountEventCopyWith<$Res> {
  factory $FinancialCountEventCopyWith(
          FinancialCountEvent value, $Res Function(FinancialCountEvent) then) =
      _$FinancialCountEventCopyWithImpl<$Res, FinancialCountEvent>;
}

/// @nodoc
class _$FinancialCountEventCopyWithImpl<$Res, $Val extends FinancialCountEvent>
    implements $FinancialCountEventCopyWith<$Res> {
  _$FinancialCountEventCopyWithImpl(this._value, this._then);

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
    extends _$FinancialCountEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'FinancialCountEvent.started()';
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
    required TResult Function(String description, String value, String category)
        addData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        updateData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        deleteData,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String description, String value, String category)?
        addData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? deleteData,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String description, String value, String category)?
        addData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? deleteData,
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
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_DeleteData value) deleteData,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_DeleteData value)? deleteData,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddData value)? addData,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_DeleteData value)? deleteData,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements FinancialCountEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddDataImplCopyWith<$Res> {
  factory _$$AddDataImplCopyWith(
          _$AddDataImpl value, $Res Function(_$AddDataImpl) then) =
      __$$AddDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String description, String value, String category});
}

/// @nodoc
class __$$AddDataImplCopyWithImpl<$Res>
    extends _$FinancialCountEventCopyWithImpl<$Res, _$AddDataImpl>
    implements _$$AddDataImplCopyWith<$Res> {
  __$$AddDataImplCopyWithImpl(
      _$AddDataImpl _value, $Res Function(_$AddDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? value = null,
    Object? category = null,
  }) {
    return _then(_$AddDataImpl(
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddDataImpl implements _AddData {
  const _$AddDataImpl(this.description, this.value, this.category);

  @override
  final String description;
  @override
  final String value;
  @override
  final String category;

  @override
  String toString() {
    return 'FinancialCountEvent.addData(description: $description, value: $value, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDataImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, value, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDataImplCopyWith<_$AddDataImpl> get copyWith =>
      __$$AddDataImplCopyWithImpl<_$AddDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String description, String value, String category)
        addData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        updateData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        deleteData,
  }) {
    return addData(description, value, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String description, String value, String category)?
        addData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? deleteData,
  }) {
    return addData?.call(description, value, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String description, String value, String category)?
        addData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? deleteData,
    required TResult orElse(),
  }) {
    if (addData != null) {
      return addData(description, value, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_DeleteData value) deleteData,
  }) {
    return addData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_DeleteData value)? deleteData,
  }) {
    return addData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddData value)? addData,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_DeleteData value)? deleteData,
    required TResult orElse(),
  }) {
    if (addData != null) {
      return addData(this);
    }
    return orElse();
  }
}

abstract class _AddData implements FinancialCountEvent {
  const factory _AddData(
          final String description, final String value, final String category) =
      _$AddDataImpl;

  String get description;
  String get value;
  String get category;
  @JsonKey(ignore: true)
  _$$AddDataImplCopyWith<_$AddDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDataImplCopyWith<$Res> {
  factory _$$UpdateDataImplCopyWith(
          _$UpdateDataImpl value, $Res Function(_$UpdateDataImpl) then) =
      __$$UpdateDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FinancialRecordEntity financialRecordEntity});
}

/// @nodoc
class __$$UpdateDataImplCopyWithImpl<$Res>
    extends _$FinancialCountEventCopyWithImpl<$Res, _$UpdateDataImpl>
    implements _$$UpdateDataImplCopyWith<$Res> {
  __$$UpdateDataImplCopyWithImpl(
      _$UpdateDataImpl _value, $Res Function(_$UpdateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? financialRecordEntity = null,
  }) {
    return _then(_$UpdateDataImpl(
      null == financialRecordEntity
          ? _value.financialRecordEntity
          : financialRecordEntity // ignore: cast_nullable_to_non_nullable
              as FinancialRecordEntity,
    ));
  }
}

/// @nodoc

class _$UpdateDataImpl implements _UpdateData {
  const _$UpdateDataImpl(this.financialRecordEntity);

  @override
  final FinancialRecordEntity financialRecordEntity;

  @override
  String toString() {
    return 'FinancialCountEvent.updateData(financialRecordEntity: $financialRecordEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDataImpl &&
            (identical(other.financialRecordEntity, financialRecordEntity) ||
                other.financialRecordEntity == financialRecordEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, financialRecordEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDataImplCopyWith<_$UpdateDataImpl> get copyWith =>
      __$$UpdateDataImplCopyWithImpl<_$UpdateDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String description, String value, String category)
        addData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        updateData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        deleteData,
  }) {
    return updateData(financialRecordEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String description, String value, String category)?
        addData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? deleteData,
  }) {
    return updateData?.call(financialRecordEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String description, String value, String category)?
        addData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? deleteData,
    required TResult orElse(),
  }) {
    if (updateData != null) {
      return updateData(financialRecordEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_DeleteData value) deleteData,
  }) {
    return updateData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_DeleteData value)? deleteData,
  }) {
    return updateData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddData value)? addData,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_DeleteData value)? deleteData,
    required TResult orElse(),
  }) {
    if (updateData != null) {
      return updateData(this);
    }
    return orElse();
  }
}

abstract class _UpdateData implements FinancialCountEvent {
  const factory _UpdateData(final FinancialRecordEntity financialRecordEntity) =
      _$UpdateDataImpl;

  FinancialRecordEntity get financialRecordEntity;
  @JsonKey(ignore: true)
  _$$UpdateDataImplCopyWith<_$UpdateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteDataImplCopyWith<$Res> {
  factory _$$DeleteDataImplCopyWith(
          _$DeleteDataImpl value, $Res Function(_$DeleteDataImpl) then) =
      __$$DeleteDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({FinancialRecordEntity financialRecordEntity});
}

/// @nodoc
class __$$DeleteDataImplCopyWithImpl<$Res>
    extends _$FinancialCountEventCopyWithImpl<$Res, _$DeleteDataImpl>
    implements _$$DeleteDataImplCopyWith<$Res> {
  __$$DeleteDataImplCopyWithImpl(
      _$DeleteDataImpl _value, $Res Function(_$DeleteDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? financialRecordEntity = null,
  }) {
    return _then(_$DeleteDataImpl(
      null == financialRecordEntity
          ? _value.financialRecordEntity
          : financialRecordEntity // ignore: cast_nullable_to_non_nullable
              as FinancialRecordEntity,
    ));
  }
}

/// @nodoc

class _$DeleteDataImpl implements _DeleteData {
  const _$DeleteDataImpl(this.financialRecordEntity);

  @override
  final FinancialRecordEntity financialRecordEntity;

  @override
  String toString() {
    return 'FinancialCountEvent.deleteData(financialRecordEntity: $financialRecordEntity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteDataImpl &&
            (identical(other.financialRecordEntity, financialRecordEntity) ||
                other.financialRecordEntity == financialRecordEntity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, financialRecordEntity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteDataImplCopyWith<_$DeleteDataImpl> get copyWith =>
      __$$DeleteDataImplCopyWithImpl<_$DeleteDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String description, String value, String category)
        addData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        updateData,
    required TResult Function(FinancialRecordEntity financialRecordEntity)
        deleteData,
  }) {
    return deleteData(financialRecordEntity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String description, String value, String category)?
        addData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult? Function(FinancialRecordEntity financialRecordEntity)? deleteData,
  }) {
    return deleteData?.call(financialRecordEntity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String description, String value, String category)?
        addData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? updateData,
    TResult Function(FinancialRecordEntity financialRecordEntity)? deleteData,
    required TResult orElse(),
  }) {
    if (deleteData != null) {
      return deleteData(financialRecordEntity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_AddData value) addData,
    required TResult Function(_UpdateData value) updateData,
    required TResult Function(_DeleteData value) deleteData,
  }) {
    return deleteData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_AddData value)? addData,
    TResult? Function(_UpdateData value)? updateData,
    TResult? Function(_DeleteData value)? deleteData,
  }) {
    return deleteData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_AddData value)? addData,
    TResult Function(_UpdateData value)? updateData,
    TResult Function(_DeleteData value)? deleteData,
    required TResult orElse(),
  }) {
    if (deleteData != null) {
      return deleteData(this);
    }
    return orElse();
  }
}

abstract class _DeleteData implements FinancialCountEvent {
  const factory _DeleteData(final FinancialRecordEntity financialRecordEntity) =
      _$DeleteDataImpl;

  FinancialRecordEntity get financialRecordEntity;
  @JsonKey(ignore: true)
  _$$DeleteDataImplCopyWith<_$DeleteDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FinancialCountState {
  String get message => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isSuccess => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FinancialCountStateCopyWith<FinancialCountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinancialCountStateCopyWith<$Res> {
  factory $FinancialCountStateCopyWith(
          FinancialCountState value, $Res Function(FinancialCountState) then) =
      _$FinancialCountStateCopyWithImpl<$Res, FinancialCountState>;
  @useResult
  $Res call({String message, bool isLoading, bool isSuccess});
}

/// @nodoc
class _$FinancialCountStateCopyWithImpl<$Res, $Val extends FinancialCountState>
    implements $FinancialCountStateCopyWith<$Res> {
  _$FinancialCountStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
    Object? isSuccess = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FinancialCountStateImplCopyWith<$Res>
    implements $FinancialCountStateCopyWith<$Res> {
  factory _$$FinancialCountStateImplCopyWith(_$FinancialCountStateImpl value,
          $Res Function(_$FinancialCountStateImpl) then) =
      __$$FinancialCountStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool isLoading, bool isSuccess});
}

/// @nodoc
class __$$FinancialCountStateImplCopyWithImpl<$Res>
    extends _$FinancialCountStateCopyWithImpl<$Res, _$FinancialCountStateImpl>
    implements _$$FinancialCountStateImplCopyWith<$Res> {
  __$$FinancialCountStateImplCopyWithImpl(_$FinancialCountStateImpl _value,
      $Res Function(_$FinancialCountStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? isLoading = null,
    Object? isSuccess = null,
  }) {
    return _then(_$FinancialCountStateImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isSuccess: null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FinancialCountStateImpl implements _FinancialCountState {
  const _$FinancialCountStateImpl(
      {required this.message,
      required this.isLoading,
      required this.isSuccess});

  @override
  final String message;
  @override
  final bool isLoading;
  @override
  final bool isSuccess;

  @override
  String toString() {
    return 'FinancialCountState(message: $message, isLoading: $isLoading, isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FinancialCountStateImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isLoading, isSuccess);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FinancialCountStateImplCopyWith<_$FinancialCountStateImpl> get copyWith =>
      __$$FinancialCountStateImplCopyWithImpl<_$FinancialCountStateImpl>(
          this, _$identity);
}

abstract class _FinancialCountState implements FinancialCountState {
  const factory _FinancialCountState(
      {required final String message,
      required final bool isLoading,
      required final bool isSuccess}) = _$FinancialCountStateImpl;

  @override
  String get message;
  @override
  bool get isLoading;
  @override
  bool get isSuccess;
  @override
  @JsonKey(ignore: true)
  _$$FinancialCountStateImplCopyWith<_$FinancialCountStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
