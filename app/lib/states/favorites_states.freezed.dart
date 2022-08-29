// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'favorites_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FavoritesStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FavoriteStop> favorites) data,
    required TResult Function() loading,
    required TResult Function(Exception exception) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<FavoriteStop> favorites)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FavoriteStop> favorites)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesStatesData value) data,
    required TResult Function(FavoritesStatesLoading value) loading,
    required TResult Function(FavoritesStatesError value) exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesStatesData value)? data,
    TResult Function(FavoritesStatesLoading value)? loading,
    TResult Function(FavoritesStatesError value)? exception,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStatesData value)? data,
    TResult Function(FavoritesStatesLoading value)? loading,
    TResult Function(FavoritesStatesError value)? exception,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
abstract class _$$FavoritesStatesDataCopyWith<$Res> {
  factory _$$FavoritesStatesDataCopyWith(_$FavoritesStatesData value,
          $Res Function(_$FavoritesStatesData) then) =
      __$$FavoritesStatesDataCopyWithImpl<$Res>;
  $Res call({List<FavoriteStop> favorites});
}

/// @nodoc
class __$$FavoritesStatesDataCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res>
    implements _$$FavoritesStatesDataCopyWith<$Res> {
  __$$FavoritesStatesDataCopyWithImpl(
      _$FavoritesStatesData _value, $Res Function(_$FavoritesStatesData) _then)
      : super(_value, (v) => _then(v as _$FavoritesStatesData));

  @override
  _$FavoritesStatesData get _value => super._value as _$FavoritesStatesData;

  @override
  $Res call({
    Object? favorites = freezed,
  }) {
    return _then(_$FavoritesStatesData(
      favorites == freezed
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<FavoriteStop>,
    ));
  }
}

/// @nodoc

class _$FavoritesStatesData implements FavoritesStatesData {
  const _$FavoritesStatesData(final List<FavoriteStop> favorites)
      : _favorites = favorites;

  final List<FavoriteStop> _favorites;
  @override
  List<FavoriteStop> get favorites {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favorites);
  }

  @override
  String toString() {
    return 'FavoritesStates.data(favorites: $favorites)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesStatesData &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_favorites));

  @JsonKey(ignore: true)
  @override
  _$$FavoritesStatesDataCopyWith<_$FavoritesStatesData> get copyWith =>
      __$$FavoritesStatesDataCopyWithImpl<_$FavoritesStatesData>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FavoriteStop> favorites) data,
    required TResult Function() loading,
    required TResult Function(Exception exception) exception,
  }) {
    return data(favorites);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<FavoriteStop> favorites)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
  }) {
    return data?.call(favorites);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FavoriteStop> favorites)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(favorites);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesStatesData value) data,
    required TResult Function(FavoritesStatesLoading value) loading,
    required TResult Function(FavoritesStatesError value) exception,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesStatesData value)? data,
    TResult Function(FavoritesStatesLoading value)? loading,
    TResult Function(FavoritesStatesError value)? exception,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStatesData value)? data,
    TResult Function(FavoritesStatesLoading value)? loading,
    TResult Function(FavoritesStatesError value)? exception,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class FavoritesStatesData implements FavoritesStates {
  const factory FavoritesStatesData(final List<FavoriteStop> favorites) =
      _$FavoritesStatesData;

  List<FavoriteStop> get favorites;
  @JsonKey(ignore: true)
  _$$FavoritesStatesDataCopyWith<_$FavoritesStatesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoritesStatesLoadingCopyWith<$Res> {
  factory _$$FavoritesStatesLoadingCopyWith(_$FavoritesStatesLoading value,
          $Res Function(_$FavoritesStatesLoading) then) =
      __$$FavoritesStatesLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoritesStatesLoadingCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res>
    implements _$$FavoritesStatesLoadingCopyWith<$Res> {
  __$$FavoritesStatesLoadingCopyWithImpl(_$FavoritesStatesLoading _value,
      $Res Function(_$FavoritesStatesLoading) _then)
      : super(_value, (v) => _then(v as _$FavoritesStatesLoading));

  @override
  _$FavoritesStatesLoading get _value =>
      super._value as _$FavoritesStatesLoading;
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FavoritesStatesLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FavoriteStop> favorites) data,
    required TResult Function() loading,
    required TResult Function(Exception exception) exception,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<FavoriteStop> favorites)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FavoriteStop> favorites)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesStatesData value) data,
    required TResult Function(FavoritesStatesLoading value) loading,
    required TResult Function(FavoritesStatesError value) exception,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesStatesData value)? data,
    TResult Function(FavoritesStatesLoading value)? loading,
    TResult Function(FavoritesStatesError value)? exception,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStatesData value)? data,
    TResult Function(FavoritesStatesLoading value)? loading,
    TResult Function(FavoritesStatesError value)? exception,
    required TResult orElse(),
  }) {
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
abstract class _$$FavoritesStatesErrorCopyWith<$Res> {
  factory _$$FavoritesStatesErrorCopyWith(_$FavoritesStatesError value,
          $Res Function(_$FavoritesStatesError) then) =
      __$$FavoritesStatesErrorCopyWithImpl<$Res>;
  $Res call({Exception exception});
}

/// @nodoc
class __$$FavoritesStatesErrorCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res>
    implements _$$FavoritesStatesErrorCopyWith<$Res> {
  __$$FavoritesStatesErrorCopyWithImpl(_$FavoritesStatesError _value,
      $Res Function(_$FavoritesStatesError) _then)
      : super(_value, (v) => _then(v as _$FavoritesStatesError));

  @override
  _$FavoritesStatesError get _value => super._value as _$FavoritesStatesError;

  @override
  $Res call({
    Object? exception = freezed,
  }) {
    return _then(_$FavoritesStatesError(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$FavoritesStatesError implements FavoritesStatesError {
  const _$FavoritesStatesError(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'FavoritesStates.exception(exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesStatesError &&
            const DeepCollectionEquality().equals(other.exception, exception));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(exception));

  @JsonKey(ignore: true)
  @override
  _$$FavoritesStatesErrorCopyWith<_$FavoritesStatesError> get copyWith =>
      __$$FavoritesStatesErrorCopyWithImpl<_$FavoritesStatesError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<FavoriteStop> favorites) data,
    required TResult Function() loading,
    required TResult Function(Exception exception) exception,
  }) {
    return exception(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<FavoriteStop> favorites)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
  }) {
    return exception?.call(this.exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<FavoriteStop> favorites)? data,
    TResult Function()? loading,
    TResult Function(Exception exception)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this.exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FavoritesStatesData value) data,
    required TResult Function(FavoritesStatesLoading value) loading,
    required TResult Function(FavoritesStatesError value) exception,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FavoritesStatesData value)? data,
    TResult Function(FavoritesStatesLoading value)? loading,
    TResult Function(FavoritesStatesError value)? exception,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FavoritesStatesData value)? data,
    TResult Function(FavoritesStatesLoading value)? loading,
    TResult Function(FavoritesStatesError value)? exception,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class FavoritesStatesError implements FavoritesStates {
  const factory FavoritesStatesError(final Exception exception) =
      _$FavoritesStatesError;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$FavoritesStatesErrorCopyWith<_$FavoritesStatesError> get copyWith =>
      throw _privateConstructorUsedError;
}
