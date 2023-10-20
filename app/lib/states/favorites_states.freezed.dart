// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
    TResult? Function(List<FavoriteStop> favorites)? data,
    TResult? Function()? loading,
    TResult? Function(Exception exception)? exception,
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
    TResult? Function(FavoritesStatesData value)? data,
    TResult? Function(FavoritesStatesLoading value)? loading,
    TResult? Function(FavoritesStatesError value)? exception,
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
      _$FavoritesStatesCopyWithImpl<$Res, FavoritesStates>;
}

/// @nodoc
class _$FavoritesStatesCopyWithImpl<$Res, $Val extends FavoritesStates>
    implements $FavoritesStatesCopyWith<$Res> {
  _$FavoritesStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$FavoritesStatesDataImplCopyWith<$Res> {
  factory _$$FavoritesStatesDataImplCopyWith(_$FavoritesStatesDataImpl value,
          $Res Function(_$FavoritesStatesDataImpl) then) =
      __$$FavoritesStatesDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<FavoriteStop> favorites});
}

/// @nodoc
class __$$FavoritesStatesDataImplCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res, _$FavoritesStatesDataImpl>
    implements _$$FavoritesStatesDataImplCopyWith<$Res> {
  __$$FavoritesStatesDataImplCopyWithImpl(_$FavoritesStatesDataImpl _value,
      $Res Function(_$FavoritesStatesDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? favorites = null,
  }) {
    return _then(_$FavoritesStatesDataImpl(
      null == favorites
          ? _value._favorites
          : favorites // ignore: cast_nullable_to_non_nullable
              as List<FavoriteStop>,
    ));
  }
}

/// @nodoc

class _$FavoritesStatesDataImpl implements FavoritesStatesData {
  const _$FavoritesStatesDataImpl(final List<FavoriteStop> favorites)
      : _favorites = favorites;

  final List<FavoriteStop> _favorites;
  @override
  List<FavoriteStop> get favorites {
    if (_favorites is EqualUnmodifiableListView) return _favorites;
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
            other is _$FavoritesStatesDataImpl &&
            const DeepCollectionEquality()
                .equals(other._favorites, _favorites));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_favorites));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesStatesDataImplCopyWith<_$FavoritesStatesDataImpl> get copyWith =>
      __$$FavoritesStatesDataImplCopyWithImpl<_$FavoritesStatesDataImpl>(
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
    TResult? Function(List<FavoriteStop> favorites)? data,
    TResult? Function()? loading,
    TResult? Function(Exception exception)? exception,
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
    TResult? Function(FavoritesStatesData value)? data,
    TResult? Function(FavoritesStatesLoading value)? loading,
    TResult? Function(FavoritesStatesError value)? exception,
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
      _$FavoritesStatesDataImpl;

  List<FavoriteStop> get favorites;
  @JsonKey(ignore: true)
  _$$FavoritesStatesDataImplCopyWith<_$FavoritesStatesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FavoritesStatesLoadingImplCopyWith<$Res> {
  factory _$$FavoritesStatesLoadingImplCopyWith(
          _$FavoritesStatesLoadingImpl value,
          $Res Function(_$FavoritesStatesLoadingImpl) then) =
      __$$FavoritesStatesLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FavoritesStatesLoadingImplCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res, _$FavoritesStatesLoadingImpl>
    implements _$$FavoritesStatesLoadingImplCopyWith<$Res> {
  __$$FavoritesStatesLoadingImplCopyWithImpl(
      _$FavoritesStatesLoadingImpl _value,
      $Res Function(_$FavoritesStatesLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FavoritesStatesLoadingImpl implements FavoritesStatesLoading {
  const _$FavoritesStatesLoadingImpl();

  @override
  String toString() {
    return 'FavoritesStates.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoritesStatesLoadingImpl);
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
    TResult? Function(List<FavoriteStop> favorites)? data,
    TResult? Function()? loading,
    TResult? Function(Exception exception)? exception,
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
    TResult? Function(FavoritesStatesData value)? data,
    TResult? Function(FavoritesStatesLoading value)? loading,
    TResult? Function(FavoritesStatesError value)? exception,
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
  const factory FavoritesStatesLoading() = _$FavoritesStatesLoadingImpl;
}

/// @nodoc
abstract class _$$FavoritesStatesErrorImplCopyWith<$Res> {
  factory _$$FavoritesStatesErrorImplCopyWith(_$FavoritesStatesErrorImpl value,
          $Res Function(_$FavoritesStatesErrorImpl) then) =
      __$$FavoritesStatesErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Exception exception});
}

/// @nodoc
class __$$FavoritesStatesErrorImplCopyWithImpl<$Res>
    extends _$FavoritesStatesCopyWithImpl<$Res, _$FavoritesStatesErrorImpl>
    implements _$$FavoritesStatesErrorImplCopyWith<$Res> {
  __$$FavoritesStatesErrorImplCopyWithImpl(_$FavoritesStatesErrorImpl _value,
      $Res Function(_$FavoritesStatesErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$FavoritesStatesErrorImpl(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$FavoritesStatesErrorImpl implements FavoritesStatesError {
  const _$FavoritesStatesErrorImpl(this.exception);

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
            other is _$FavoritesStatesErrorImpl &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoritesStatesErrorImplCopyWith<_$FavoritesStatesErrorImpl>
      get copyWith =>
          __$$FavoritesStatesErrorImplCopyWithImpl<_$FavoritesStatesErrorImpl>(
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
    TResult? Function(List<FavoriteStop> favorites)? data,
    TResult? Function()? loading,
    TResult? Function(Exception exception)? exception,
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
    TResult? Function(FavoritesStatesData value)? data,
    TResult? Function(FavoritesStatesLoading value)? loading,
    TResult? Function(FavoritesStatesError value)? exception,
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
      _$FavoritesStatesErrorImpl;

  Exception get exception;
  @JsonKey(ignore: true)
  _$$FavoritesStatesErrorImplCopyWith<_$FavoritesStatesErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
