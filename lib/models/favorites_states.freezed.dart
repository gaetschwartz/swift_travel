// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'favorites_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$FavoritesStatesTearOff {
  const _$FavoritesStatesTearOff();

// ignore: unused_element
  FavoritesStatesData data(List<CffCompletion> completions) {
    return FavoritesStatesData(
      completions,
    );
  }

// ignore: unused_element
  FavoritesStatesLoading loading() {
    return const FavoritesStatesLoading();
  }

// ignore: unused_element
  FavoritesStatesError exception(Exception exception) {
    return FavoritesStatesError(
      exception,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $FavoritesStates = _$FavoritesStatesTearOff();

/// @nodoc
mixin _$FavoritesStates {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<CffCompletion> completions),
    @required Result loading(),
    @required Result exception(Exception exception),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<CffCompletion> completions),
    Result loading(),
    Result exception(Exception exception),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(FavoritesStatesData value),
    @required Result loading(FavoritesStatesLoading value),
    @required Result exception(FavoritesStatesError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(FavoritesStatesData value),
    Result loading(FavoritesStatesLoading value),
    Result exception(FavoritesStatesError value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $FavoritesStatesCopyWith<$Res> {
  factory $FavoritesStatesCopyWith(
          FavoritesStates value, $Res Function(FavoritesStates) then) =
      _$FavoritesStatesCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesStatesCopyWithImpl<$Res>
    implements $FavoritesStatesCopyWith<$Res> {
  _$FavoritesStatesCopyWithImpl(this._value, this._then);

  final FavoritesStates _value;
  // ignore: unused_field
  final $Res Function(FavoritesStates) _then;
}

/// @nodoc
abstract class $FavoritesStatesDataCopyWith<$Res> {
  factory $FavoritesStatesDataCopyWith(
          FavoritesStatesData value, $Res Function(FavoritesStatesData) then) =
      _$FavoritesStatesDataCopyWithImpl<$Res>;
  $Res call({List<CffCompletion> completions});
}

/// @nodoc
class _$FavoritesStatesDataCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res>
    implements $FavoritesStatesDataCopyWith<$Res> {
  _$FavoritesStatesDataCopyWithImpl(
      FavoritesStatesData _value, $Res Function(FavoritesStatesData) _then)
      : super(_value, (v) => _then(v as FavoritesStatesData));

  @override
  FavoritesStatesData get _value => super._value as FavoritesStatesData;

  @override
  $Res call({
    Object completions = freezed,
  }) {
    return _then(FavoritesStatesData(
      completions == freezed
          ? _value.completions
          : completions as List<CffCompletion>,
    ));
  }
}

/// @nodoc
class _$FavoritesStatesData implements FavoritesStatesData {
  const _$FavoritesStatesData(this.completions) : assert(completions != null);

  @override
  final List<CffCompletion> completions;

  @override
  String toString() {
    return 'FavoritesStates.data(completions: $completions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavoritesStatesData &&
            (identical(other.completions, completions) ||
                const DeepCollectionEquality()
                    .equals(other.completions, completions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(completions);

  @override
  $FavoritesStatesDataCopyWith<FavoritesStatesData> get copyWith =>
      _$FavoritesStatesDataCopyWithImpl<FavoritesStatesData>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<CffCompletion> completions),
    @required Result loading(),
    @required Result exception(Exception exception),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return data(completions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<CffCompletion> completions),
    Result loading(),
    Result exception(Exception exception),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(completions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(FavoritesStatesData value),
    @required Result loading(FavoritesStatesLoading value),
    @required Result exception(FavoritesStatesError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(FavoritesStatesData value),
    Result loading(FavoritesStatesLoading value),
    Result exception(FavoritesStatesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class FavoritesStatesData implements FavoritesStates {
  const factory FavoritesStatesData(List<CffCompletion> completions) =
      _$FavoritesStatesData;

  List<CffCompletion> get completions;
  $FavoritesStatesDataCopyWith<FavoritesStatesData> get copyWith;
}

/// @nodoc
abstract class $FavoritesStatesLoadingCopyWith<$Res> {
  factory $FavoritesStatesLoadingCopyWith(FavoritesStatesLoading value,
          $Res Function(FavoritesStatesLoading) then) =
      _$FavoritesStatesLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$FavoritesStatesLoadingCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res>
    implements $FavoritesStatesLoadingCopyWith<$Res> {
  _$FavoritesStatesLoadingCopyWithImpl(FavoritesStatesLoading _value,
      $Res Function(FavoritesStatesLoading) _then)
      : super(_value, (v) => _then(v as FavoritesStatesLoading));

  @override
  FavoritesStatesLoading get _value => super._value as FavoritesStatesLoading;
}

/// @nodoc
class _$FavoritesStatesLoading implements FavoritesStatesLoading {
  const _$FavoritesStatesLoading();

  @override
  String toString() {
    return 'FavoritesStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoritesStatesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<CffCompletion> completions),
    @required Result loading(),
    @required Result exception(Exception exception),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<CffCompletion> completions),
    Result loading(),
    Result exception(Exception exception),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(FavoritesStatesData value),
    @required Result loading(FavoritesStatesLoading value),
    @required Result exception(FavoritesStatesError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(FavoritesStatesData value),
    Result loading(FavoritesStatesLoading value),
    Result exception(FavoritesStatesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoritesStatesLoading implements FavoritesStates {
  const factory FavoritesStatesLoading() = _$FavoritesStatesLoading;
}

/// @nodoc
abstract class $FavoritesStatesErrorCopyWith<$Res> {
  factory $FavoritesStatesErrorCopyWith(FavoritesStatesError value,
          $Res Function(FavoritesStatesError) then) =
      _$FavoritesStatesErrorCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class _$FavoritesStatesErrorCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res>
    implements $FavoritesStatesErrorCopyWith<$Res> {
  _$FavoritesStatesErrorCopyWithImpl(
      FavoritesStatesError _value, $Res Function(FavoritesStatesError) _then)
      : super(_value, (v) => _then(v as FavoritesStatesError));

  @override
  FavoritesStatesError get _value => super._value as FavoritesStatesError;

  @override
  $Res call({
    Object exception = freezed,
  }) {
    return _then(FavoritesStatesError(
      exception == freezed ? _value.exception : exception as Exception,
    ));
  }
}

/// @nodoc
class _$FavoritesStatesError implements FavoritesStatesError {
  const _$FavoritesStatesError(this.exception) : assert(exception != null);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'FavoritesStates.exception(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavoritesStatesError &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exception);

  @override
  $FavoritesStatesErrorCopyWith<FavoritesStatesError> get copyWith =>
      _$FavoritesStatesErrorCopyWithImpl<FavoritesStatesError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<CffCompletion> completions),
    @required Result loading(),
    @required Result exception(Exception exception),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return exception(this.exception);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<CffCompletion> completions),
    Result loading(),
    Result exception(Exception exception),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exception != null) {
      return exception(this.exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(FavoritesStatesData value),
    @required Result loading(FavoritesStatesLoading value),
    @required Result exception(FavoritesStatesError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return exception(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(FavoritesStatesData value),
    Result loading(FavoritesStatesLoading value),
    Result exception(FavoritesStatesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class FavoritesStatesError implements FavoritesStates {
  const factory FavoritesStatesError(Exception exception) =
      _$FavoritesStatesError;

  Exception get exception;
  $FavoritesStatesErrorCopyWith<FavoritesStatesError> get copyWith;
}
