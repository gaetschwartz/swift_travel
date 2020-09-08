// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'station_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$StationStatesTearOff {
  const _$StationStatesTearOff();

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  StationCompletions completions(List<CffCompletion> completions) {
    return StationCompletions(
      completions,
    );
  }

// ignore: unused_element
  Empty empty() {
    return const Empty();
  }

// ignore: unused_element
  NetworkError networkError() {
    return const NetworkError();
  }

// ignore: unused_element
  Error error(Object error) {
    return Error(
      error,
    );
  }
}

// ignore: unused_element
const $StationStates = _$StationStatesTearOff();

mixin _$StationStates {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result completions(List<CffCompletion> completions),
    @required Result empty(),
    @required Result networkError(),
    @required Result error(Object error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result completions(List<CffCompletion> completions),
    Result empty(),
    Result networkError(),
    Result error(Object error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result completions(StationCompletions value),
    @required Result empty(Empty value),
    @required Result networkError(NetworkError value),
    @required Result error(Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result completions(StationCompletions value),
    Result empty(Empty value),
    Result networkError(NetworkError value),
    Result error(Error value),
    @required Result orElse(),
  });
}

abstract class $StationStatesCopyWith<$Res> {
  factory $StationStatesCopyWith(
          StationStates value, $Res Function(StationStates) then) =
      _$StationStatesCopyWithImpl<$Res>;
}

class _$StationStatesCopyWithImpl<$Res>
    implements $StationStatesCopyWith<$Res> {
  _$StationStatesCopyWithImpl(this._value, this._then);

  final StationStates _value;
  // ignore: unused_field
  final $Res Function(StationStates) _then;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$StationStatesCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'StationStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result completions(List<CffCompletion> completions),
    @required Result empty(),
    @required Result networkError(),
    @required Result error(Object error),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result completions(List<CffCompletion> completions),
    Result empty(),
    Result networkError(),
    Result error(Object error),
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
    @required Result loading(Loading value),
    @required Result completions(StationCompletions value),
    @required Result empty(Empty value),
    @required Result networkError(NetworkError value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result completions(StationCompletions value),
    Result empty(Empty value),
    Result networkError(NetworkError value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements StationStates {
  const factory Loading() = _$Loading;
}

abstract class $StationCompletionsCopyWith<$Res> {
  factory $StationCompletionsCopyWith(
          StationCompletions value, $Res Function(StationCompletions) then) =
      _$StationCompletionsCopyWithImpl<$Res>;
  $Res call({List<CffCompletion> completions});
}

class _$StationCompletionsCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res>
    implements $StationCompletionsCopyWith<$Res> {
  _$StationCompletionsCopyWithImpl(
      StationCompletions _value, $Res Function(StationCompletions) _then)
      : super(_value, (v) => _then(v as StationCompletions));

  @override
  StationCompletions get _value => super._value as StationCompletions;

  @override
  $Res call({
    Object completions = freezed,
  }) {
    return _then(StationCompletions(
      completions == freezed
          ? _value.completions
          : completions as List<CffCompletion>,
    ));
  }
}

class _$StationCompletions implements StationCompletions {
  const _$StationCompletions(this.completions) : assert(completions != null);

  @override
  final List<CffCompletion> completions;

  @override
  String toString() {
    return 'StationStates.completions(completions: $completions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is StationCompletions &&
            (identical(other.completions, completions) ||
                const DeepCollectionEquality()
                    .equals(other.completions, completions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(completions);

  @override
  $StationCompletionsCopyWith<StationCompletions> get copyWith =>
      _$StationCompletionsCopyWithImpl<StationCompletions>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result completions(List<CffCompletion> completions),
    @required Result empty(),
    @required Result networkError(),
    @required Result error(Object error),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return completions(this.completions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result completions(List<CffCompletion> completions),
    Result empty(),
    Result networkError(),
    Result error(Object error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (completions != null) {
      return completions(this.completions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result completions(StationCompletions value),
    @required Result empty(Empty value),
    @required Result networkError(NetworkError value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return completions(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result completions(StationCompletions value),
    Result empty(Empty value),
    Result networkError(NetworkError value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (completions != null) {
      return completions(this);
    }
    return orElse();
  }
}

abstract class StationCompletions implements StationStates {
  const factory StationCompletions(List<CffCompletion> completions) =
      _$StationCompletions;

  List<CffCompletion> get completions;
  $StationCompletionsCopyWith<StationCompletions> get copyWith;
}

abstract class $EmptyCopyWith<$Res> {
  factory $EmptyCopyWith(Empty value, $Res Function(Empty) then) =
      _$EmptyCopyWithImpl<$Res>;
}

class _$EmptyCopyWithImpl<$Res> extends _$StationStatesCopyWithImpl<$Res>
    implements $EmptyCopyWith<$Res> {
  _$EmptyCopyWithImpl(Empty _value, $Res Function(Empty) _then)
      : super(_value, (v) => _then(v as Empty));

  @override
  Empty get _value => super._value as Empty;
}

class _$Empty implements Empty {
  const _$Empty();

  @override
  String toString() {
    return 'StationStates.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result completions(List<CffCompletion> completions),
    @required Result empty(),
    @required Result networkError(),
    @required Result error(Object error),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result completions(List<CffCompletion> completions),
    Result empty(),
    Result networkError(),
    Result error(Object error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result completions(StationCompletions value),
    @required Result empty(Empty value),
    @required Result networkError(NetworkError value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result completions(StationCompletions value),
    Result empty(Empty value),
    Result networkError(NetworkError value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty implements StationStates {
  const factory Empty() = _$Empty;
}

abstract class $NetworkErrorCopyWith<$Res> {
  factory $NetworkErrorCopyWith(
          NetworkError value, $Res Function(NetworkError) then) =
      _$NetworkErrorCopyWithImpl<$Res>;
}

class _$NetworkErrorCopyWithImpl<$Res> extends _$StationStatesCopyWithImpl<$Res>
    implements $NetworkErrorCopyWith<$Res> {
  _$NetworkErrorCopyWithImpl(
      NetworkError _value, $Res Function(NetworkError) _then)
      : super(_value, (v) => _then(v as NetworkError));

  @override
  NetworkError get _value => super._value as NetworkError;
}

class _$NetworkError implements NetworkError {
  const _$NetworkError();

  @override
  String toString() {
    return 'StationStates.networkError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NetworkError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result completions(List<CffCompletion> completions),
    @required Result empty(),
    @required Result networkError(),
    @required Result error(Object error),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return networkError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result completions(List<CffCompletion> completions),
    Result empty(),
    Result networkError(),
    Result error(Object error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result completions(StationCompletions value),
    @required Result empty(Empty value),
    @required Result networkError(NetworkError value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result completions(StationCompletions value),
    Result empty(Empty value),
    Result networkError(NetworkError value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements StationStates {
  const factory NetworkError() = _$NetworkError;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({Object error});
}

class _$ErrorCopyWithImpl<$Res> extends _$StationStatesCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(Error _value, $Res Function(Error) _then)
      : super(_value, (v) => _then(v as Error));

  @override
  Error get _value => super._value as Error;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(Error(
      error == freezed ? _value.error : error,
    ));
  }
}

class _$Error implements Error {
  const _$Error(this.error) : assert(error != null);

  @override
  final Object error;

  @override
  String toString() {
    return 'StationStates.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Error &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result loading(),
    @required Result completions(List<CffCompletion> completions),
    @required Result empty(),
    @required Result networkError(),
    @required Result error(Object error),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result loading(),
    Result completions(List<CffCompletion> completions),
    Result empty(),
    Result networkError(),
    Result error(Object error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result loading(Loading value),
    @required Result completions(StationCompletions value),
    @required Result empty(Empty value),
    @required Result networkError(NetworkError value),
    @required Result error(Error value),
  }) {
    assert(loading != null);
    assert(completions != null);
    assert(empty != null);
    assert(networkError != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result loading(Loading value),
    Result completions(StationCompletions value),
    Result empty(Empty value),
    Result networkError(NetworkError value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error implements StationStates {
  const factory Error(Object error) = _$Error;

  Object get error;
  $ErrorCopyWith<Error> get copyWith;
}
