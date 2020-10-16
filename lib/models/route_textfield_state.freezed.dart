// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'route_textfield_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$RouteTextfieldStateTearOff {
  const _$RouteTextfieldStateTearOff();

// ignore: unused_element
  RouteTextfieldStateEmpty empty() {
    return const RouteTextfieldStateEmpty();
  }

// ignore: unused_element
  RouteTextfieldStateText text(String text) {
    return RouteTextfieldStateText(
      text,
    );
  }

// ignore: unused_element
  RouteTextfieldStateLocation currentLocation(String location,
      {@required double lat, @required double lon}) {
    return RouteTextfieldStateLocation(
      location,
      lat: lat,
      lon: lon,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $RouteTextfieldState = _$RouteTextfieldStateTearOff();

/// @nodoc
mixin _$RouteTextfieldState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result empty(),
    @required Result text(String text),
    @required Result currentLocation(String location, double lat, double lon),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(),
    Result text(String text),
    Result currentLocation(String location, double lat, double lon),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(RouteTextfieldStateEmpty value),
    @required Result text(RouteTextfieldStateText value),
    @required Result currentLocation(RouteTextfieldStateLocation value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(RouteTextfieldStateEmpty value),
    Result text(RouteTextfieldStateText value),
    Result currentLocation(RouteTextfieldStateLocation value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $RouteTextfieldStateCopyWith<$Res> {
  factory $RouteTextfieldStateCopyWith(
          RouteTextfieldState value, $Res Function(RouteTextfieldState) then) =
      _$RouteTextfieldStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteTextfieldStateCopyWithImpl<$Res>
    implements $RouteTextfieldStateCopyWith<$Res> {
  _$RouteTextfieldStateCopyWithImpl(this._value, this._then);

  final RouteTextfieldState _value;
  // ignore: unused_field
  final $Res Function(RouteTextfieldState) _then;
}

/// @nodoc
abstract class $RouteTextfieldStateEmptyCopyWith<$Res> {
  factory $RouteTextfieldStateEmptyCopyWith(RouteTextfieldStateEmpty value,
          $Res Function(RouteTextfieldStateEmpty) then) =
      _$RouteTextfieldStateEmptyCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteTextfieldStateEmptyCopyWithImpl<$Res>
    extends _$RouteTextfieldStateCopyWithImpl<$Res>
    implements $RouteTextfieldStateEmptyCopyWith<$Res> {
  _$RouteTextfieldStateEmptyCopyWithImpl(RouteTextfieldStateEmpty _value,
      $Res Function(RouteTextfieldStateEmpty) _then)
      : super(_value, (v) => _then(v as RouteTextfieldStateEmpty));

  @override
  RouteTextfieldStateEmpty get _value =>
      super._value as RouteTextfieldStateEmpty;
}

/// @nodoc
class _$RouteTextfieldStateEmpty implements RouteTextfieldStateEmpty {
  const _$RouteTextfieldStateEmpty();

  @override
  String toString() {
    return 'RouteTextfieldState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RouteTextfieldStateEmpty);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result empty(),
    @required Result text(String text),
    @required Result currentLocation(String location, double lat, double lon),
  }) {
    assert(empty != null);
    assert(text != null);
    assert(currentLocation != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(),
    Result text(String text),
    Result currentLocation(String location, double lat, double lon),
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
    @required Result empty(RouteTextfieldStateEmpty value),
    @required Result text(RouteTextfieldStateText value),
    @required Result currentLocation(RouteTextfieldStateLocation value),
  }) {
    assert(empty != null);
    assert(text != null);
    assert(currentLocation != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(RouteTextfieldStateEmpty value),
    Result text(RouteTextfieldStateText value),
    Result currentLocation(RouteTextfieldStateLocation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class RouteTextfieldStateEmpty implements RouteTextfieldState {
  const factory RouteTextfieldStateEmpty() = _$RouteTextfieldStateEmpty;
}

/// @nodoc
abstract class $RouteTextfieldStateTextCopyWith<$Res> {
  factory $RouteTextfieldStateTextCopyWith(RouteTextfieldStateText value,
          $Res Function(RouteTextfieldStateText) then) =
      _$RouteTextfieldStateTextCopyWithImpl<$Res>;
  $Res call({String text});
}

/// @nodoc
class _$RouteTextfieldStateTextCopyWithImpl<$Res>
    extends _$RouteTextfieldStateCopyWithImpl<$Res>
    implements $RouteTextfieldStateTextCopyWith<$Res> {
  _$RouteTextfieldStateTextCopyWithImpl(RouteTextfieldStateText _value,
      $Res Function(RouteTextfieldStateText) _then)
      : super(_value, (v) => _then(v as RouteTextfieldStateText));

  @override
  RouteTextfieldStateText get _value => super._value as RouteTextfieldStateText;

  @override
  $Res call({
    Object text = freezed,
  }) {
    return _then(RouteTextfieldStateText(
      text == freezed ? _value.text : text as String,
    ));
  }
}

/// @nodoc
class _$RouteTextfieldStateText implements RouteTextfieldStateText {
  const _$RouteTextfieldStateText(this.text) : assert(text != null);

  @override
  final String text;

  @override
  String toString() {
    return 'RouteTextfieldState.text(text: $text)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteTextfieldStateText &&
            (identical(other.text, text) ||
                const DeepCollectionEquality().equals(other.text, text)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(text);

  @override
  $RouteTextfieldStateTextCopyWith<RouteTextfieldStateText> get copyWith =>
      _$RouteTextfieldStateTextCopyWithImpl<RouteTextfieldStateText>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result empty(),
    @required Result text(String text),
    @required Result currentLocation(String location, double lat, double lon),
  }) {
    assert(empty != null);
    assert(text != null);
    assert(currentLocation != null);
    return text(this.text);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(),
    Result text(String text),
    Result currentLocation(String location, double lat, double lon),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (text != null) {
      return text(this.text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(RouteTextfieldStateEmpty value),
    @required Result text(RouteTextfieldStateText value),
    @required Result currentLocation(RouteTextfieldStateLocation value),
  }) {
    assert(empty != null);
    assert(text != null);
    assert(currentLocation != null);
    return text(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(RouteTextfieldStateEmpty value),
    Result text(RouteTextfieldStateText value),
    Result currentLocation(RouteTextfieldStateLocation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (text != null) {
      return text(this);
    }
    return orElse();
  }
}

abstract class RouteTextfieldStateText implements RouteTextfieldState {
  const factory RouteTextfieldStateText(String text) =
      _$RouteTextfieldStateText;

  String get text;
  $RouteTextfieldStateTextCopyWith<RouteTextfieldStateText> get copyWith;
}

/// @nodoc
abstract class $RouteTextfieldStateLocationCopyWith<$Res> {
  factory $RouteTextfieldStateLocationCopyWith(
          RouteTextfieldStateLocation value,
          $Res Function(RouteTextfieldStateLocation) then) =
      _$RouteTextfieldStateLocationCopyWithImpl<$Res>;
  $Res call({String location, double lat, double lon});
}

/// @nodoc
class _$RouteTextfieldStateLocationCopyWithImpl<$Res>
    extends _$RouteTextfieldStateCopyWithImpl<$Res>
    implements $RouteTextfieldStateLocationCopyWith<$Res> {
  _$RouteTextfieldStateLocationCopyWithImpl(RouteTextfieldStateLocation _value,
      $Res Function(RouteTextfieldStateLocation) _then)
      : super(_value, (v) => _then(v as RouteTextfieldStateLocation));

  @override
  RouteTextfieldStateLocation get _value =>
      super._value as RouteTextfieldStateLocation;

  @override
  $Res call({
    Object location = freezed,
    Object lat = freezed,
    Object lon = freezed,
  }) {
    return _then(RouteTextfieldStateLocation(
      location == freezed ? _value.location : location as String,
      lat: lat == freezed ? _value.lat : lat as double,
      lon: lon == freezed ? _value.lon : lon as double,
    ));
  }
}

/// @nodoc
class _$RouteTextfieldStateLocation implements RouteTextfieldStateLocation {
  const _$RouteTextfieldStateLocation(this.location,
      {@required this.lat, @required this.lon})
      : assert(location != null),
        assert(lat != null),
        assert(lon != null);

  @override
  final String location;
  @override
  final double lat;
  @override
  final double lon;

  @override
  String toString() {
    return 'RouteTextfieldState.currentLocation(location: $location, lat: $lat, lon: $lon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RouteTextfieldStateLocation &&
            (identical(other.location, location) ||
                const DeepCollectionEquality()
                    .equals(other.location, location)) &&
            (identical(other.lat, lat) ||
                const DeepCollectionEquality().equals(other.lat, lat)) &&
            (identical(other.lon, lon) ||
                const DeepCollectionEquality().equals(other.lon, lon)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(location) ^
      const DeepCollectionEquality().hash(lat) ^
      const DeepCollectionEquality().hash(lon);

  @override
  $RouteTextfieldStateLocationCopyWith<RouteTextfieldStateLocation>
      get copyWith => _$RouteTextfieldStateLocationCopyWithImpl<
          RouteTextfieldStateLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result empty(),
    @required Result text(String text),
    @required Result currentLocation(String location, double lat, double lon),
  }) {
    assert(empty != null);
    assert(text != null);
    assert(currentLocation != null);
    return currentLocation(location, lat, lon);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result empty(),
    Result text(String text),
    Result currentLocation(String location, double lat, double lon),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (currentLocation != null) {
      return currentLocation(location, lat, lon);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result empty(RouteTextfieldStateEmpty value),
    @required Result text(RouteTextfieldStateText value),
    @required Result currentLocation(RouteTextfieldStateLocation value),
  }) {
    assert(empty != null);
    assert(text != null);
    assert(currentLocation != null);
    return currentLocation(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result empty(RouteTextfieldStateEmpty value),
    Result text(RouteTextfieldStateText value),
    Result currentLocation(RouteTextfieldStateLocation value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (currentLocation != null) {
      return currentLocation(this);
    }
    return orElse();
  }
}

abstract class RouteTextfieldStateLocation implements RouteTextfieldState {
  const factory RouteTextfieldStateLocation(String location,
      {@required double lat,
      @required double lon}) = _$RouteTextfieldStateLocation;

  String get location;
  double get lat;
  double get lon;
  $RouteTextfieldStateLocationCopyWith<RouteTextfieldStateLocation>
      get copyWith;
}
