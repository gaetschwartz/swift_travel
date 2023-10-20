// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'station_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StationStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Completion> completions) completions,
    required TResult Function() empty,
    required TResult Function() network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Completion> completions)? completions,
    TResult? Function()? empty,
    TResult? Function()? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Completion> completions)? completions,
    TResult Function()? empty,
    TResult Function()? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompletionsStationStates value) completions,
    required TResult Function(EmptyStationStates value) empty,
    required TResult Function(NetworkErrorStationStates value) network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompletionsStationStates value)? completions,
    TResult? Function(EmptyStationStates value)? empty,
    TResult? Function(NetworkErrorStationStates value)? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompletionsStationStates value)? completions,
    TResult Function(EmptyStationStates value)? empty,
    TResult Function(NetworkErrorStationStates value)? network,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StationStatesCopyWith<$Res> {
  factory $StationStatesCopyWith(
          StationStates value, $Res Function(StationStates) then) =
      _$StationStatesCopyWithImpl<$Res, StationStates>;
}

/// @nodoc
class _$StationStatesCopyWithImpl<$Res, $Val extends StationStates>
    implements $StationStatesCopyWith<$Res> {
  _$StationStatesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CompletionsStationStatesImplCopyWith<$Res> {
  factory _$$CompletionsStationStatesImplCopyWith(
          _$CompletionsStationStatesImpl value,
          $Res Function(_$CompletionsStationStatesImpl) then) =
      __$$CompletionsStationStatesImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Completion> completions});
}

/// @nodoc
class __$$CompletionsStationStatesImplCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res, _$CompletionsStationStatesImpl>
    implements _$$CompletionsStationStatesImplCopyWith<$Res> {
  __$$CompletionsStationStatesImplCopyWithImpl(
      _$CompletionsStationStatesImpl _value,
      $Res Function(_$CompletionsStationStatesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completions = null,
  }) {
    return _then(_$CompletionsStationStatesImpl(
      null == completions
          ? _value._completions
          : completions // ignore: cast_nullable_to_non_nullable
              as List<Completion>,
    ));
  }
}

/// @nodoc

class _$CompletionsStationStatesImpl implements CompletionsStationStates {
  const _$CompletionsStationStatesImpl(final List<Completion> completions)
      : _completions = completions;

  final List<Completion> _completions;
  @override
  List<Completion> get completions {
    if (_completions is EqualUnmodifiableListView) return _completions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completions);
  }

  @override
  String toString() {
    return 'StationStates.completions(completions: $completions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletionsStationStatesImpl &&
            const DeepCollectionEquality()
                .equals(other._completions, _completions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_completions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletionsStationStatesImplCopyWith<_$CompletionsStationStatesImpl>
      get copyWith => __$$CompletionsStationStatesImplCopyWithImpl<
          _$CompletionsStationStatesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Completion> completions) completions,
    required TResult Function() empty,
    required TResult Function() network,
  }) {
    return completions(this.completions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Completion> completions)? completions,
    TResult? Function()? empty,
    TResult? Function()? network,
  }) {
    return completions?.call(this.completions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Completion> completions)? completions,
    TResult Function()? empty,
    TResult Function()? network,
    required TResult orElse(),
  }) {
    if (completions != null) {
      return completions(this.completions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompletionsStationStates value) completions,
    required TResult Function(EmptyStationStates value) empty,
    required TResult Function(NetworkErrorStationStates value) network,
  }) {
    return completions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompletionsStationStates value)? completions,
    TResult? Function(EmptyStationStates value)? empty,
    TResult? Function(NetworkErrorStationStates value)? network,
  }) {
    return completions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompletionsStationStates value)? completions,
    TResult Function(EmptyStationStates value)? empty,
    TResult Function(NetworkErrorStationStates value)? network,
    required TResult orElse(),
  }) {
    if (completions != null) {
      return completions(this);
    }
    return orElse();
  }
}

abstract class CompletionsStationStates implements StationStates {
  const factory CompletionsStationStates(final List<Completion> completions) =
      _$CompletionsStationStatesImpl;

  List<Completion> get completions;
  @JsonKey(ignore: true)
  _$$CompletionsStationStatesImplCopyWith<_$CompletionsStationStatesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyStationStatesImplCopyWith<$Res> {
  factory _$$EmptyStationStatesImplCopyWith(_$EmptyStationStatesImpl value,
          $Res Function(_$EmptyStationStatesImpl) then) =
      __$$EmptyStationStatesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyStationStatesImplCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res, _$EmptyStationStatesImpl>
    implements _$$EmptyStationStatesImplCopyWith<$Res> {
  __$$EmptyStationStatesImplCopyWithImpl(_$EmptyStationStatesImpl _value,
      $Res Function(_$EmptyStationStatesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyStationStatesImpl implements EmptyStationStates {
  const _$EmptyStationStatesImpl();

  @override
  String toString() {
    return 'StationStates.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyStationStatesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Completion> completions) completions,
    required TResult Function() empty,
    required TResult Function() network,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Completion> completions)? completions,
    TResult? Function()? empty,
    TResult? Function()? network,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Completion> completions)? completions,
    TResult Function()? empty,
    TResult Function()? network,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompletionsStationStates value) completions,
    required TResult Function(EmptyStationStates value) empty,
    required TResult Function(NetworkErrorStationStates value) network,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompletionsStationStates value)? completions,
    TResult? Function(EmptyStationStates value)? empty,
    TResult? Function(NetworkErrorStationStates value)? network,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompletionsStationStates value)? completions,
    TResult Function(EmptyStationStates value)? empty,
    TResult Function(NetworkErrorStationStates value)? network,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyStationStates implements StationStates {
  const factory EmptyStationStates() = _$EmptyStationStatesImpl;
}

/// @nodoc
abstract class _$$NetworkErrorStationStatesImplCopyWith<$Res> {
  factory _$$NetworkErrorStationStatesImplCopyWith(
          _$NetworkErrorStationStatesImpl value,
          $Res Function(_$NetworkErrorStationStatesImpl) then) =
      __$$NetworkErrorStationStatesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkErrorStationStatesImplCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res, _$NetworkErrorStationStatesImpl>
    implements _$$NetworkErrorStationStatesImplCopyWith<$Res> {
  __$$NetworkErrorStationStatesImplCopyWithImpl(
      _$NetworkErrorStationStatesImpl _value,
      $Res Function(_$NetworkErrorStationStatesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NetworkErrorStationStatesImpl implements NetworkErrorStationStates {
  const _$NetworkErrorStationStatesImpl();

  @override
  String toString() {
    return 'StationStates.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorStationStatesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Completion> completions) completions,
    required TResult Function() empty,
    required TResult Function() network,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Completion> completions)? completions,
    TResult? Function()? empty,
    TResult? Function()? network,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Completion> completions)? completions,
    TResult Function()? empty,
    TResult Function()? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CompletionsStationStates value) completions,
    required TResult Function(EmptyStationStates value) empty,
    required TResult Function(NetworkErrorStationStates value) network,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(CompletionsStationStates value)? completions,
    TResult? Function(EmptyStationStates value)? empty,
    TResult? Function(NetworkErrorStationStates value)? network,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CompletionsStationStates value)? completions,
    TResult Function(EmptyStationStates value)? empty,
    TResult Function(NetworkErrorStationStates value)? network,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkErrorStationStates implements StationStates {
  const factory NetworkErrorStationStates() = _$NetworkErrorStationStatesImpl;
}
