// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'cff_complete.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$CffCompleteTearOff {
  const _$CffCompleteTearOff();

// ignore: unused_element
  _CffComplete call(String resultFor, List<CffCompletion> completion) {
    return _CffComplete(
      resultFor,
      completion,
    );
  }
}

// ignore: unused_element
const $CffComplete = _$CffCompleteTearOff();

mixin _$CffComplete {
  String get resultFor;
  List<CffCompletion> get completion;

  $CffCompleteCopyWith<CffComplete> get copyWith;
}

abstract class $CffCompleteCopyWith<$Res> {
  factory $CffCompleteCopyWith(
          CffComplete value, $Res Function(CffComplete) then) =
      _$CffCompleteCopyWithImpl<$Res>;
  $Res call({String resultFor, List<CffCompletion> completion});
}

class _$CffCompleteCopyWithImpl<$Res> implements $CffCompleteCopyWith<$Res> {
  _$CffCompleteCopyWithImpl(this._value, this._then);

  final CffComplete _value;
  // ignore: unused_field
  final $Res Function(CffComplete) _then;

  @override
  $Res call({
    Object resultFor = freezed,
    Object completion = freezed,
  }) {
    return _then(_value.copyWith(
      resultFor: resultFor == freezed ? _value.resultFor : resultFor as String,
      completion: completion == freezed
          ? _value.completion
          : completion as List<CffCompletion>,
    ));
  }
}

abstract class _$CffCompleteCopyWith<$Res>
    implements $CffCompleteCopyWith<$Res> {
  factory _$CffCompleteCopyWith(
          _CffComplete value, $Res Function(_CffComplete) then) =
      __$CffCompleteCopyWithImpl<$Res>;
  @override
  $Res call({String resultFor, List<CffCompletion> completion});
}

class __$CffCompleteCopyWithImpl<$Res> extends _$CffCompleteCopyWithImpl<$Res>
    implements _$CffCompleteCopyWith<$Res> {
  __$CffCompleteCopyWithImpl(
      _CffComplete _value, $Res Function(_CffComplete) _then)
      : super(_value, (v) => _then(v as _CffComplete));

  @override
  _CffComplete get _value => super._value as _CffComplete;

  @override
  $Res call({
    Object resultFor = freezed,
    Object completion = freezed,
  }) {
    return _then(_CffComplete(
      resultFor == freezed ? _value.resultFor : resultFor as String,
      completion == freezed
          ? _value.completion
          : completion as List<CffCompletion>,
    ));
  }
}

class _$_CffComplete implements _CffComplete {
  _$_CffComplete(this.resultFor, this.completion)
      : assert(resultFor != null),
        assert(completion != null);

  @override
  final String resultFor;
  @override
  final List<CffCompletion> completion;

  @override
  String toString() {
    return 'CffComplete(resultFor: $resultFor, completion: $completion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CffComplete &&
            (identical(other.resultFor, resultFor) ||
                const DeepCollectionEquality()
                    .equals(other.resultFor, resultFor)) &&
            (identical(other.completion, completion) ||
                const DeepCollectionEquality()
                    .equals(other.completion, completion)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(resultFor) ^
      const DeepCollectionEquality().hash(completion);

  @override
  _$CffCompleteCopyWith<_CffComplete> get copyWith =>
      __$CffCompleteCopyWithImpl<_CffComplete>(this, _$identity);
}

abstract class _CffComplete implements CffComplete {
  factory _CffComplete(String resultFor, List<CffCompletion> completion) =
      _$_CffComplete;

  @override
  String get resultFor;
  @override
  List<CffCompletion> get completion;
  @override
  _$CffCompleteCopyWith<_CffComplete> get copyWith;
}
