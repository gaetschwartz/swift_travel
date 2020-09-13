// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'favorites_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FavoritesStatesTearOff {
  const _$FavoritesStatesTearOff();

// ignore: unused_element
  Data data(List<CffCompletion> completions) {
    return Data(
      completions,
    );
  }

// ignore: unused_element
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Error error(Object error) {
    return Error(
      error,
    );
  }
}

// ignore: unused_element
const $FavoritesStates = _$FavoritesStatesTearOff();

mixin _$FavoritesStates {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<CffCompletion> completions),
    @required Result loading(),
    @required Result error(Object error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<CffCompletion> completions),
    Result loading(),
    Result error(Object error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result data(Data value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(Data value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  });
}

abstract class $FavoritesStatesCopyWith<$Res> {
  factory $FavoritesStatesCopyWith(
          FavoritesStates value, $Res Function(FavoritesStates) then) =
      _$FavoritesStatesCopyWithImpl<$Res>;
}

class _$FavoritesStatesCopyWithImpl<$Res>
    implements $FavoritesStatesCopyWith<$Res> {
  _$FavoritesStatesCopyWithImpl(this._value, this._then);

  final FavoritesStates _value;
  // ignore: unused_field
  final $Res Function(FavoritesStates) _then;
}

abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({List<CffCompletion> completions});
}

class _$DataCopyWithImpl<$Res> extends _$FavoritesStatesCopyWithImpl<$Res>
    implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(Data _value, $Res Function(Data) _then)
      : super(_value, (v) => _then(v as Data));

  @override
  Data get _value => super._value as Data;

  @override
  $Res call({
    Object completions = freezed,
  }) {
    return _then(Data(
      completions == freezed
          ? _value.completions
          : completions as List<CffCompletion>,
    ));
  }
}

class _$Data implements Data {
  const _$Data(this.completions) : assert(completions != null);

  @override
  final List<CffCompletion> completions;

  @override
  String toString() {
    return 'FavoritesStates.data(completions: $completions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Data &&
            (identical(other.completions, completions) ||
                const DeepCollectionEquality()
                    .equals(other.completions, completions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(completions);

  @override
  $DataCopyWith<Data> get copyWith =>
      _$DataCopyWithImpl<Data>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result data(List<CffCompletion> completions),
    @required Result loading(),
    @required Result error(Object error),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(completions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<CffCompletion> completions),
    Result loading(),
    Result error(Object error),
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
    @required Result data(Data value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return data(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(Data value),
    Result loading(Loading value),
    Result error(Error value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class Data implements FavoritesStates {
  const factory Data(List<CffCompletion> completions) = _$Data;

  List<CffCompletion> get completions;
  $DataCopyWith<Data> get copyWith;
}

abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

class _$LoadingCopyWithImpl<$Res> extends _$FavoritesStatesCopyWithImpl<$Res>
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
    return 'FavoritesStates.loading()';
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
    @required Result data(List<CffCompletion> completions),
    @required Result loading(),
    @required Result error(Object error),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<CffCompletion> completions),
    Result loading(),
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
    @required Result data(Data value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(Data value),
    Result loading(Loading value),
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

abstract class Loading implements FavoritesStates {
  const factory Loading() = _$Loading;
}

abstract class $ErrorCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) then) =
      _$ErrorCopyWithImpl<$Res>;
  $Res call({Object error});
}

class _$ErrorCopyWithImpl<$Res> extends _$FavoritesStatesCopyWithImpl<$Res>
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
    return 'FavoritesStates.error(error: $error)';
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
    @required Result data(List<CffCompletion> completions),
    @required Result loading(),
    @required Result error(Object error),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result data(List<CffCompletion> completions),
    Result loading(),
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
    @required Result data(Data value),
    @required Result loading(Loading value),
    @required Result error(Error value),
  }) {
    assert(data != null);
    assert(loading != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result data(Data value),
    Result loading(Loading value),
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

abstract class Error implements FavoritesStates {
  const factory Error(Object error) = _$Error;

  Object get error;
  $ErrorCopyWith<Error> get copyWith;
}
