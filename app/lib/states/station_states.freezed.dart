// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'station_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$StationStatesTearOff {
  const _$StationStatesTearOff();

  CompletionsStationStates completions(List<NavigationCompletion> completions) {
    return CompletionsStationStates(
      completions,
    );
  }

  EmptyStationStates empty() {
    return const EmptyStationStates();
  }

  NetworkErrorStationStates network() {
    return const NetworkErrorStationStates();
  }
}

/// @nodoc
const $StationStates = _$StationStatesTearOff();

/// @nodoc
mixin _$StationStates {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NavigationCompletion> completions)
        completions,
    required TResult Function() empty,
    required TResult Function() network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<NavigationCompletion> completions)? completions,
    TResult Function()? empty,
    TResult Function()? network,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NavigationCompletion> completions)? completions,
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
    TResult Function(CompletionsStationStates value)? completions,
    TResult Function(EmptyStationStates value)? empty,
    TResult Function(NetworkErrorStationStates value)? network,
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
      _$StationStatesCopyWithImpl<$Res>;
}

/// @nodoc
class _$StationStatesCopyWithImpl<$Res>
    implements $StationStatesCopyWith<$Res> {
  _$StationStatesCopyWithImpl(this._value, this._then);

  final StationStates _value;
  // ignore: unused_field
  final $Res Function(StationStates) _then;
}

/// @nodoc
abstract class $CompletionsStationStatesCopyWith<$Res> {
  factory $CompletionsStationStatesCopyWith(CompletionsStationStates value,
          $Res Function(CompletionsStationStates) then) =
      _$CompletionsStationStatesCopyWithImpl<$Res>;
  $Res call({List<NavigationCompletion> completions});
}

/// @nodoc
class _$CompletionsStationStatesCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res>
    implements $CompletionsStationStatesCopyWith<$Res> {
  _$CompletionsStationStatesCopyWithImpl(CompletionsStationStates _value,
      $Res Function(CompletionsStationStates) _then)
      : super(_value, (v) => _then(v as CompletionsStationStates));

  @override
  CompletionsStationStates get _value =>
      super._value as CompletionsStationStates;

  @override
  $Res call({
    Object? completions = freezed,
  }) {
    return _then(CompletionsStationStates(
      completions == freezed
          ? _value.completions
          : completions // ignore: cast_nullable_to_non_nullable
              as List<NavigationCompletion>,
    ));
  }
}

/// @nodoc

class _$CompletionsStationStates implements CompletionsStationStates {
  const _$CompletionsStationStates(this.completions);

  @override
  final List<NavigationCompletion> completions;

  @override
  String toString() {
    return 'StationStates.completions(completions: $completions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CompletionsStationStates &&
            const DeepCollectionEquality()
                .equals(other.completions, completions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(completions));

  @JsonKey(ignore: true)
  @override
  $CompletionsStationStatesCopyWith<CompletionsStationStates> get copyWith =>
      _$CompletionsStationStatesCopyWithImpl<CompletionsStationStates>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NavigationCompletion> completions)
        completions,
    required TResult Function() empty,
    required TResult Function() network,
  }) {
    return completions(this.completions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<NavigationCompletion> completions)? completions,
    TResult Function()? empty,
    TResult Function()? network,
  }) {
    return completions?.call(this.completions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NavigationCompletion> completions)? completions,
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
    TResult Function(CompletionsStationStates value)? completions,
    TResult Function(EmptyStationStates value)? empty,
    TResult Function(NetworkErrorStationStates value)? network,
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
  const factory CompletionsStationStates(
      List<NavigationCompletion> completions) = _$CompletionsStationStates;

  List<NavigationCompletion> get completions;
  @JsonKey(ignore: true)
  $CompletionsStationStatesCopyWith<CompletionsStationStates> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptyStationStatesCopyWith<$Res> {
  factory $EmptyStationStatesCopyWith(
          EmptyStationStates value, $Res Function(EmptyStationStates) then) =
      _$EmptyStationStatesCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmptyStationStatesCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res>
    implements $EmptyStationStatesCopyWith<$Res> {
  _$EmptyStationStatesCopyWithImpl(
      EmptyStationStates _value, $Res Function(EmptyStationStates) _then)
      : super(_value, (v) => _then(v as EmptyStationStates));

  @override
  EmptyStationStates get _value => super._value as EmptyStationStates;
}

/// @nodoc

class _$EmptyStationStates implements EmptyStationStates {
  const _$EmptyStationStates();

  @override
  String toString() {
    return 'StationStates.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EmptyStationStates);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NavigationCompletion> completions)
        completions,
    required TResult Function() empty,
    required TResult Function() network,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<NavigationCompletion> completions)? completions,
    TResult Function()? empty,
    TResult Function()? network,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NavigationCompletion> completions)? completions,
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
    TResult Function(CompletionsStationStates value)? completions,
    TResult Function(EmptyStationStates value)? empty,
    TResult Function(NetworkErrorStationStates value)? network,
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
  const factory EmptyStationStates() = _$EmptyStationStates;
}

/// @nodoc
abstract class $NetworkErrorStationStatesCopyWith<$Res> {
  factory $NetworkErrorStationStatesCopyWith(NetworkErrorStationStates value,
          $Res Function(NetworkErrorStationStates) then) =
      _$NetworkErrorStationStatesCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetworkErrorStationStatesCopyWithImpl<$Res>
    extends _$StationStatesCopyWithImpl<$Res>
    implements $NetworkErrorStationStatesCopyWith<$Res> {
  _$NetworkErrorStationStatesCopyWithImpl(NetworkErrorStationStates _value,
      $Res Function(NetworkErrorStationStates) _then)
      : super(_value, (v) => _then(v as NetworkErrorStationStates));

  @override
  NetworkErrorStationStates get _value =>
      super._value as NetworkErrorStationStates;
}

/// @nodoc

class _$NetworkErrorStationStates implements NetworkErrorStationStates {
  const _$NetworkErrorStationStates();

  @override
  String toString() {
    return 'StationStates.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NetworkErrorStationStates);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<NavigationCompletion> completions)
        completions,
    required TResult Function() empty,
    required TResult Function() network,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(List<NavigationCompletion> completions)? completions,
    TResult Function()? empty,
    TResult Function()? network,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<NavigationCompletion> completions)? completions,
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
    TResult Function(CompletionsStationStates value)? completions,
    TResult Function(EmptyStationStates value)? empty,
    TResult Function(NetworkErrorStationStates value)? network,
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
  const factory NetworkErrorStationStates() = _$NetworkErrorStationStates;
}
