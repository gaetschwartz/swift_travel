// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TerminalContext {
  List<String> get command => throw _privateConstructorUsedError;
  Writer get w => throw _privateConstructorUsedError;
  StateController<List<TerminalCommandResult>> get stateController =>
      throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TerminalContextCopyWith<TerminalContext> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TerminalContextCopyWith<$Res> {
  factory $TerminalContextCopyWith(
          TerminalContext value, $Res Function(TerminalContext) then) =
      _$TerminalContextCopyWithImpl<$Res, TerminalContext>;
  @useResult
  $Res call(
      {List<String> command,
      Writer w,
      StateController<List<TerminalCommandResult>> stateController,
      BuildContext context});
}

/// @nodoc
class _$TerminalContextCopyWithImpl<$Res, $Val extends TerminalContext>
    implements $TerminalContextCopyWith<$Res> {
  _$TerminalContextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? w = null,
    Object? stateController = null,
    Object? context = null,
  }) {
    return _then(_value.copyWith(
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as List<String>,
      w: null == w
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as Writer,
      stateController: null == stateController
          ? _value.stateController
          : stateController // ignore: cast_nullable_to_non_nullable
              as StateController<List<TerminalCommandResult>>,
      context: null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TerminalContextImplCopyWith<$Res>
    implements $TerminalContextCopyWith<$Res> {
  factory _$$TerminalContextImplCopyWith(_$TerminalContextImpl value,
          $Res Function(_$TerminalContextImpl) then) =
      __$$TerminalContextImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> command,
      Writer w,
      StateController<List<TerminalCommandResult>> stateController,
      BuildContext context});
}

/// @nodoc
class __$$TerminalContextImplCopyWithImpl<$Res>
    extends _$TerminalContextCopyWithImpl<$Res, _$TerminalContextImpl>
    implements _$$TerminalContextImplCopyWith<$Res> {
  __$$TerminalContextImplCopyWithImpl(
      _$TerminalContextImpl _value, $Res Function(_$TerminalContextImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? w = null,
    Object? stateController = null,
    Object? context = null,
  }) {
    return _then(_$TerminalContextImpl(
      null == command
          ? _value._command
          : command // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == w
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as Writer,
      null == stateController
          ? _value.stateController
          : stateController // ignore: cast_nullable_to_non_nullable
              as StateController<List<TerminalCommandResult>>,
      null == context
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$TerminalContextImpl implements _TerminalContext {
  const _$TerminalContextImpl(
      final List<String> command, this.w, this.stateController, this.context)
      : _command = command;

  final List<String> _command;
  @override
  List<String> get command {
    if (_command is EqualUnmodifiableListView) return _command;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_command);
  }

  @override
  final Writer w;
  @override
  final StateController<List<TerminalCommandResult>> stateController;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'TerminalContext(command: $command, w: $w, stateController: $stateController, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalContextImpl &&
            const DeepCollectionEquality().equals(other._command, _command) &&
            (identical(other.w, w) || other.w == w) &&
            (identical(other.stateController, stateController) ||
                other.stateController == stateController) &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_command),
      w,
      stateController,
      context);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TerminalContextImplCopyWith<_$TerminalContextImpl> get copyWith =>
      __$$TerminalContextImplCopyWithImpl<_$TerminalContextImpl>(
          this, _$identity);
}

abstract class _TerminalContext implements TerminalContext {
  const factory _TerminalContext(
      final List<String> command,
      final Writer w,
      final StateController<List<TerminalCommandResult>> stateController,
      final BuildContext context) = _$TerminalContextImpl;

  @override
  List<String> get command;
  @override
  Writer get w;
  @override
  StateController<List<TerminalCommandResult>> get stateController;
  @override
  BuildContext get context;
  @override
  @JsonKey(ignore: true)
  _$$TerminalContextImplCopyWith<_$TerminalContextImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TerminalCommandResult {
  String get command => throw _privateConstructorUsedError;
  String get result => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TerminalCommandResultCopyWith<TerminalCommandResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TerminalCommandResultCopyWith<$Res> {
  factory $TerminalCommandResultCopyWith(TerminalCommandResult value,
          $Res Function(TerminalCommandResult) then) =
      _$TerminalCommandResultCopyWithImpl<$Res, TerminalCommandResult>;
  @useResult
  $Res call({String command, String result});
}

/// @nodoc
class _$TerminalCommandResultCopyWithImpl<$Res,
        $Val extends TerminalCommandResult>
    implements $TerminalCommandResultCopyWith<$Res> {
  _$TerminalCommandResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? result = null,
  }) {
    return _then(_value.copyWith(
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      result: null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TerminalCommandResultImplCopyWith<$Res>
    implements $TerminalCommandResultCopyWith<$Res> {
  factory _$$TerminalCommandResultImplCopyWith(
          _$TerminalCommandResultImpl value,
          $Res Function(_$TerminalCommandResultImpl) then) =
      __$$TerminalCommandResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String command, String result});
}

/// @nodoc
class __$$TerminalCommandResultImplCopyWithImpl<$Res>
    extends _$TerminalCommandResultCopyWithImpl<$Res,
        _$TerminalCommandResultImpl>
    implements _$$TerminalCommandResultImplCopyWith<$Res> {
  __$$TerminalCommandResultImplCopyWithImpl(_$TerminalCommandResultImpl _value,
      $Res Function(_$TerminalCommandResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? result = null,
  }) {
    return _then(_$TerminalCommandResultImpl(
      null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      null == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TerminalCommandResultImpl implements _TerminalCommandResult {
  const _$TerminalCommandResultImpl(this.command, this.result);

  @override
  final String command;
  @override
  final String result;

  @override
  String toString() {
    return 'TerminalCommandResult(command: $command, result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TerminalCommandResultImpl &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.result, result) || other.result == result));
  }

  @override
  int get hashCode => Object.hash(runtimeType, command, result);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TerminalCommandResultImplCopyWith<_$TerminalCommandResultImpl>
      get copyWith => __$$TerminalCommandResultImplCopyWithImpl<
          _$TerminalCommandResultImpl>(this, _$identity);
}

abstract class _TerminalCommandResult implements TerminalCommandResult {
  const factory _TerminalCommandResult(
      final String command, final String result) = _$TerminalCommandResultImpl;

  @override
  String get command;
  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$TerminalCommandResultImplCopyWith<_$TerminalCommandResultImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CommandDefinition {
  String get command => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  FutureOr<void> Function(TerminalContext) get run =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CommandDefinitionCopyWith<CommandDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommandDefinitionCopyWith<$Res> {
  factory $CommandDefinitionCopyWith(
          CommandDefinition value, $Res Function(CommandDefinition) then) =
      _$CommandDefinitionCopyWithImpl<$Res, CommandDefinition>;
  @useResult
  $Res call(
      {String command,
      String description,
      FutureOr<void> Function(TerminalContext) run});
}

/// @nodoc
class _$CommandDefinitionCopyWithImpl<$Res, $Val extends CommandDefinition>
    implements $CommandDefinitionCopyWith<$Res> {
  _$CommandDefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? description = null,
    Object? run = null,
  }) {
    return _then(_value.copyWith(
      command: null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      run: null == run
          ? _value.run
          : run // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(TerminalContext),
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommandDefinitionImplCopyWith<$Res>
    implements $CommandDefinitionCopyWith<$Res> {
  factory _$$CommandDefinitionImplCopyWith(_$CommandDefinitionImpl value,
          $Res Function(_$CommandDefinitionImpl) then) =
      __$$CommandDefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String command,
      String description,
      FutureOr<void> Function(TerminalContext) run});
}

/// @nodoc
class __$$CommandDefinitionImplCopyWithImpl<$Res>
    extends _$CommandDefinitionCopyWithImpl<$Res, _$CommandDefinitionImpl>
    implements _$$CommandDefinitionImplCopyWith<$Res> {
  __$$CommandDefinitionImplCopyWithImpl(_$CommandDefinitionImpl _value,
      $Res Function(_$CommandDefinitionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? command = null,
    Object? description = null,
    Object? run = null,
  }) {
    return _then(_$CommandDefinitionImpl(
      null == command
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == run
          ? _value.run
          : run // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(TerminalContext),
    ));
  }
}

/// @nodoc

class _$CommandDefinitionImpl implements _CommandDefinition {
  const _$CommandDefinitionImpl(this.command, this.description, this.run);

  @override
  final String command;
  @override
  final String description;
  @override
  final FutureOr<void> Function(TerminalContext) run;

  @override
  String toString() {
    return 'CommandDefinition(command: $command, description: $description, run: $run)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommandDefinitionImpl &&
            (identical(other.command, command) || other.command == command) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.run, run) || other.run == run));
  }

  @override
  int get hashCode => Object.hash(runtimeType, command, description, run);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommandDefinitionImplCopyWith<_$CommandDefinitionImpl> get copyWith =>
      __$$CommandDefinitionImplCopyWithImpl<_$CommandDefinitionImpl>(
          this, _$identity);
}

abstract class _CommandDefinition implements CommandDefinition {
  const factory _CommandDefinition(
          final String command,
          final String description,
          final FutureOr<void> Function(TerminalContext) run) =
      _$CommandDefinitionImpl;

  @override
  String get command;
  @override
  String get description;
  @override
  FutureOr<void> Function(TerminalContext) get run;
  @override
  @JsonKey(ignore: true)
  _$$CommandDefinitionImplCopyWith<_$CommandDefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
