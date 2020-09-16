// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'favorites_routes_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FavoritesRoutesStatesTearOff {
  const _$FavoritesRoutesStatesTearOff();

// ignore: unused_element
  FavoritesRoutesStatesData data(List<LocalRoute> routes) {
    return FavoritesRoutesStatesData(
      routes,
    );
  }

// ignore: unused_element
  FavoritesRoutesStatesLoading loading() {
    return const FavoritesRoutesStatesLoading();
  }

// ignore: unused_element
  FavoritesRoutesStatesError exception(Exception exception) {
    return FavoritesRoutesStatesError(
      exception,
    );
  }
}

// ignore: unused_element
const $FavoritesRoutesStates = _$FavoritesRoutesStatesTearOff();

mixin _$FavoritesRoutesStates {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<LocalRoute> routes),
    @required Result loading(),
    @required Result exception(Exception exception),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<LocalRoute> routes),
    Result loading(),
    Result exception(Exception exception),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(FavoritesRoutesStatesData value),
    @required Result loading(FavoritesRoutesStatesLoading value),
    @required Result exception(FavoritesRoutesStatesError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(FavoritesRoutesStatesData value),
    Result loading(FavoritesRoutesStatesLoading value),
    Result exception(FavoritesRoutesStatesError value),
    @required Result orElse(),
  });
}

abstract class $FavoritesRoutesStatesCopyWith<$Res> {
  factory $FavoritesRoutesStatesCopyWith(FavoritesRoutesStates value,
          $Res Function(FavoritesRoutesStates) then) =
      _$FavoritesRoutesStatesCopyWithImpl<$Res>;
}

class _$FavoritesRoutesStatesCopyWithImpl<$Res>
    implements $FavoritesRoutesStatesCopyWith<$Res> {
  _$FavoritesRoutesStatesCopyWithImpl(this._value, this._then);

  final FavoritesRoutesStates _value;
  // ignore: unused_field
  final $Res Function(FavoritesRoutesStates) _then;
}

abstract class $FavoritesRoutesStatesDataCopyWith<$Res> {
  factory $FavoritesRoutesStatesDataCopyWith(FavoritesRoutesStatesData value,
          $Res Function(FavoritesRoutesStatesData) then) =
      _$FavoritesRoutesStatesDataCopyWithImpl<$Res>;
  $Res call({List<LocalRoute> routes});
}

class _$FavoritesRoutesStatesDataCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res>
    implements $FavoritesRoutesStatesDataCopyWith<$Res> {
  _$FavoritesRoutesStatesDataCopyWithImpl(FavoritesRoutesStatesData _value,
      $Res Function(FavoritesRoutesStatesData) _then)
      : super(_value, (v) => _then(v as FavoritesRoutesStatesData));

  @override
  FavoritesRoutesStatesData get _value =>
      super._value as FavoritesRoutesStatesData;

  @override
  $Res call({
    Object routes = freezed,
  }) {
    return _then(FavoritesRoutesStatesData(
      routes == freezed ? _value.routes : routes as List<LocalRoute>,
    ));
  }
}

class _$FavoritesRoutesStatesData implements FavoritesRoutesStatesData {
  const _$FavoritesRoutesStatesData(this.routes) : assert(routes != null);

  @override
  final List<LocalRoute> routes;

  @override
  String toString() {
    return 'FavoritesRoutesStates.data(routes: $routes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavoritesRoutesStatesData &&
            (identical(other.routes, routes) ||
                const DeepCollectionEquality().equals(other.routes, routes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(routes);

  @override
  $FavoritesRoutesStatesDataCopyWith<FavoritesRoutesStatesData> get copyWith =>
      _$FavoritesRoutesStatesDataCopyWithImpl<FavoritesRoutesStatesData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<LocalRoute> routes),
    @required Result loading(),
    @required Result exception(Exception exception),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return data(routes);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<LocalRoute> routes),
    Result loading(),
    Result exception(Exception exception),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(routes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(FavoritesRoutesStatesData value),
    @required Result loading(FavoritesRoutesStatesLoading value),
    @required Result exception(FavoritesRoutesStatesError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(FavoritesRoutesStatesData value),
    Result loading(FavoritesRoutesStatesLoading value),
    Result exception(FavoritesRoutesStatesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class FavoritesRoutesStatesData implements FavoritesRoutesStates {
  const factory FavoritesRoutesStatesData(List<LocalRoute> routes) =
      _$FavoritesRoutesStatesData;

  List<LocalRoute> get routes;
  $FavoritesRoutesStatesDataCopyWith<FavoritesRoutesStatesData> get copyWith;
}

abstract class $FavoritesRoutesStatesLoadingCopyWith<$Res> {
  factory $FavoritesRoutesStatesLoadingCopyWith(
          FavoritesRoutesStatesLoading value,
          $Res Function(FavoritesRoutesStatesLoading) then) =
      _$FavoritesRoutesStatesLoadingCopyWithImpl<$Res>;
}

class _$FavoritesRoutesStatesLoadingCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res>
    implements $FavoritesRoutesStatesLoadingCopyWith<$Res> {
  _$FavoritesRoutesStatesLoadingCopyWithImpl(
      FavoritesRoutesStatesLoading _value,
      $Res Function(FavoritesRoutesStatesLoading) _then)
      : super(_value, (v) => _then(v as FavoritesRoutesStatesLoading));

  @override
  FavoritesRoutesStatesLoading get _value =>
      super._value as FavoritesRoutesStatesLoading;
}

class _$FavoritesRoutesStatesLoading implements FavoritesRoutesStatesLoading {
  const _$FavoritesRoutesStatesLoading();

  @override
  String toString() {
    return 'FavoritesRoutesStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FavoritesRoutesStatesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<LocalRoute> routes),
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
    Result data(List<LocalRoute> routes),
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
    @required Result data(FavoritesRoutesStatesData value),
    @required Result loading(FavoritesRoutesStatesLoading value),
    @required Result exception(FavoritesRoutesStatesError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(FavoritesRoutesStatesData value),
    Result loading(FavoritesRoutesStatesLoading value),
    Result exception(FavoritesRoutesStatesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class FavoritesRoutesStatesLoading implements FavoritesRoutesStates {
  const factory FavoritesRoutesStatesLoading() = _$FavoritesRoutesStatesLoading;
}

abstract class $FavoritesRoutesStatesErrorCopyWith<$Res> {
  factory $FavoritesRoutesStatesErrorCopyWith(FavoritesRoutesStatesError value,
          $Res Function(FavoritesRoutesStatesError) then) =
      _$FavoritesRoutesStatesErrorCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

class _$FavoritesRoutesStatesErrorCopyWithImpl<$Res>
    extends _$FavoritesRoutesStatesCopyWithImpl<$Res>
    implements $FavoritesRoutesStatesErrorCopyWith<$Res> {
  _$FavoritesRoutesStatesErrorCopyWithImpl(FavoritesRoutesStatesError _value,
      $Res Function(FavoritesRoutesStatesError) _then)
      : super(_value, (v) => _then(v as FavoritesRoutesStatesError));

  @override
  FavoritesRoutesStatesError get _value =>
      super._value as FavoritesRoutesStatesError;

  @override
  $Res call({
    Object exception = freezed,
  }) {
    return _then(FavoritesRoutesStatesError(
      exception == freezed ? _value.exception : exception as Exception,
    ));
  }
}

class _$FavoritesRoutesStatesError implements FavoritesRoutesStatesError {
  const _$FavoritesRoutesStatesError(this.exception)
      : assert(exception != null);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'FavoritesRoutesStates.exception(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FavoritesRoutesStatesError &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(exception);

  @override
  $FavoritesRoutesStatesErrorCopyWith<FavoritesRoutesStatesError>
      get copyWith =>
          _$FavoritesRoutesStatesErrorCopyWithImpl<FavoritesRoutesStatesError>(
              this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<LocalRoute> routes),
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
    Result data(List<LocalRoute> routes),
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
    @required Result data(FavoritesRoutesStatesData value),
    @required Result loading(FavoritesRoutesStatesLoading value),
    @required Result exception(FavoritesRoutesStatesError value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(exception != null);
    return exception(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(FavoritesRoutesStatesData value),
    Result loading(FavoritesRoutesStatesLoading value),
    Result exception(FavoritesRoutesStatesError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class FavoritesRoutesStatesError implements FavoritesRoutesStates {
  const factory FavoritesRoutesStatesError(Exception exception) =
      _$FavoritesRoutesStatesError;

  Exception get exception;
  $FavoritesRoutesStatesErrorCopyWith<FavoritesRoutesStatesError> get copyWith;
}
