// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$TerminalContextCopyWithImpl<$Res>;
  $Res call(
      {List<String> command,
      Writer w,
      StateController<List<TerminalCommandResult>> stateController,
      BuildContext context});
}

/// @nodoc
class _$TerminalContextCopyWithImpl<$Res>
    implements $TerminalContextCopyWith<$Res> {
  _$TerminalContextCopyWithImpl(this._value, this._then);

  final TerminalContext _value;
  // ignore: unused_field
  final $Res Function(TerminalContext) _then;

  @override
  $Res call({
    Object? command = freezed,
    Object? w = freezed,
    Object? stateController = freezed,
    Object? context = freezed,
  }) {
    return _then(_value.copyWith(
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as List<String>,
      w: w == freezed
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as Writer,
      stateController: stateController == freezed
          ? _value.stateController
          : stateController // ignore: cast_nullable_to_non_nullable
              as StateController<List<TerminalCommandResult>>,
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
abstract class _$$_TerminalContextCopyWith<$Res>
    implements $TerminalContextCopyWith<$Res> {
  factory _$$_TerminalContextCopyWith(
          _$_TerminalContext value, $Res Function(_$_TerminalContext) then) =
      __$$_TerminalContextCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<String> command,
      Writer w,
      StateController<List<TerminalCommandResult>> stateController,
      BuildContext context});
}

/// @nodoc
class __$$_TerminalContextCopyWithImpl<$Res>
    extends _$TerminalContextCopyWithImpl<$Res>
    implements _$$_TerminalContextCopyWith<$Res> {
  __$$_TerminalContextCopyWithImpl(
      _$_TerminalContext _value, $Res Function(_$_TerminalContext) _then)
      : super(_value, (v) => _then(v as _$_TerminalContext));

  @override
  _$_TerminalContext get _value => super._value as _$_TerminalContext;

  @override
  $Res call({
    Object? command = freezed,
    Object? w = freezed,
    Object? stateController = freezed,
    Object? context = freezed,
  }) {
    return _then(_$_TerminalContext(
      command == freezed
          ? _value._command
          : command // ignore: cast_nullable_to_non_nullable
              as List<String>,
      w == freezed
          ? _value.w
          : w // ignore: cast_nullable_to_non_nullable
              as Writer,
      stateController == freezed
          ? _value.stateController
          : stateController // ignore: cast_nullable_to_non_nullable
              as StateController<List<TerminalCommandResult>>,
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$_TerminalContext implements _TerminalContext {
  const _$_TerminalContext(
      final List<String> command, this.w, this.stateController, this.context)
      : _command = command;

  final List<String> _command;
  @override
  List<String> get command {
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
            other is _$_TerminalContext &&
            const DeepCollectionEquality().equals(other._command, _command) &&
            (identical(other.w, w) || other.w == w) &&
            const DeepCollectionEquality()
                .equals(other.stateController, stateController) &&
            const DeepCollectionEquality().equals(other.context, context));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_command),
      w,
      const DeepCollectionEquality().hash(stateController),
      const DeepCollectionEquality().hash(context));

  @JsonKey(ignore: true)
  @override
  _$$_TerminalContextCopyWith<_$_TerminalContext> get copyWith =>
      __$$_TerminalContextCopyWithImpl<_$_TerminalContext>(this, _$identity);
}

abstract class _TerminalContext implements TerminalContext {
  const factory _TerminalContext(
      final List<String> command,
      final Writer w,
      final StateController<List<TerminalCommandResult>> stateController,
      final BuildContext context) = _$_TerminalContext;

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
  _$$_TerminalContextCopyWith<_$_TerminalContext> get copyWith =>
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
      _$TerminalCommandResultCopyWithImpl<$Res>;
  $Res call({String command, String result});
}

/// @nodoc
class _$TerminalCommandResultCopyWithImpl<$Res>
    implements $TerminalCommandResultCopyWith<$Res> {
  _$TerminalCommandResultCopyWithImpl(this._value, this._then);

  final TerminalCommandResult _value;
  // ignore: unused_field
  final $Res Function(TerminalCommandResult) _then;

  @override
  $Res call({
    Object? command = freezed,
    Object? result = freezed,
  }) {
    return _then(_value.copyWith(
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      result: result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_TerminalCommandResultCopyWith<$Res>
    implements $TerminalCommandResultCopyWith<$Res> {
  factory _$$_TerminalCommandResultCopyWith(_$_TerminalCommandResult value,
          $Res Function(_$_TerminalCommandResult) then) =
      __$$_TerminalCommandResultCopyWithImpl<$Res>;
  @override
  $Res call({String command, String result});
}

/// @nodoc
class __$$_TerminalCommandResultCopyWithImpl<$Res>
    extends _$TerminalCommandResultCopyWithImpl<$Res>
    implements _$$_TerminalCommandResultCopyWith<$Res> {
  __$$_TerminalCommandResultCopyWithImpl(_$_TerminalCommandResult _value,
      $Res Function(_$_TerminalCommandResult) _then)
      : super(_value, (v) => _then(v as _$_TerminalCommandResult));

  @override
  _$_TerminalCommandResult get _value =>
      super._value as _$_TerminalCommandResult;

  @override
  $Res call({
    Object? command = freezed,
    Object? result = freezed,
  }) {
    return _then(_$_TerminalCommandResult(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      result == freezed
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TerminalCommandResult implements _TerminalCommandResult {
  const _$_TerminalCommandResult(this.command, this.result);

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
            other is _$_TerminalCommandResult &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality().equals(other.result, result));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(result));

  @JsonKey(ignore: true)
  @override
  _$$_TerminalCommandResultCopyWith<_$_TerminalCommandResult> get copyWith =>
      __$$_TerminalCommandResultCopyWithImpl<_$_TerminalCommandResult>(
          this, _$identity);
}

abstract class _TerminalCommandResult implements TerminalCommandResult {
  const factory _TerminalCommandResult(
      final String command, final String result) = _$_TerminalCommandResult;

  @override
  String get command;
  @override
  String get result;
  @override
  @JsonKey(ignore: true)
  _$$_TerminalCommandResultCopyWith<_$_TerminalCommandResult> get copyWith =>
      throw _privateConstructorUsedError;
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
      _$CommandDefinitionCopyWithImpl<$Res>;
  $Res call(
      {String command,
      String description,
      FutureOr<void> Function(TerminalContext) run});
}

/// @nodoc
class _$CommandDefinitionCopyWithImpl<$Res>
    implements $CommandDefinitionCopyWith<$Res> {
  _$CommandDefinitionCopyWithImpl(this._value, this._then);

  final CommandDefinition _value;
  // ignore: unused_field
  final $Res Function(CommandDefinition) _then;

  @override
  $Res call({
    Object? command = freezed,
    Object? description = freezed,
    Object? run = freezed,
  }) {
    return _then(_value.copyWith(
      command: command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      run: run == freezed
          ? _value.run
          : run // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(TerminalContext),
    ));
  }
}

/// @nodoc
abstract class _$$_CommandDefinitionCopyWith<$Res>
    implements $CommandDefinitionCopyWith<$Res> {
  factory _$$_CommandDefinitionCopyWith(_$_CommandDefinition value,
          $Res Function(_$_CommandDefinition) then) =
      __$$_CommandDefinitionCopyWithImpl<$Res>;
  @override
  $Res call(
      {String command,
      String description,
      FutureOr<void> Function(TerminalContext) run});
}

/// @nodoc
class __$$_CommandDefinitionCopyWithImpl<$Res>
    extends _$CommandDefinitionCopyWithImpl<$Res>
    implements _$$_CommandDefinitionCopyWith<$Res> {
  __$$_CommandDefinitionCopyWithImpl(
      _$_CommandDefinition _value, $Res Function(_$_CommandDefinition) _then)
      : super(_value, (v) => _then(v as _$_CommandDefinition));

  @override
  _$_CommandDefinition get _value => super._value as _$_CommandDefinition;

  @override
  $Res call({
    Object? command = freezed,
    Object? description = freezed,
    Object? run = freezed,
  }) {
    return _then(_$_CommandDefinition(
      command == freezed
          ? _value.command
          : command // ignore: cast_nullable_to_non_nullable
              as String,
      description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      run == freezed
          ? _value.run
          : run // ignore: cast_nullable_to_non_nullable
              as FutureOr<void> Function(TerminalContext),
    ));
  }
}

/// @nodoc

class _$_CommandDefinition implements _CommandDefinition {
  const _$_CommandDefinition(this.command, this.description, this.run);

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
            other is _$_CommandDefinition &&
            const DeepCollectionEquality().equals(other.command, command) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            (identical(other.run, run) || other.run == run));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(command),
      const DeepCollectionEquality().hash(description),
      run);

  @JsonKey(ignore: true)
  @override
  _$$_CommandDefinitionCopyWith<_$_CommandDefinition> get copyWith =>
      __$$_CommandDefinitionCopyWithImpl<_$_CommandDefinition>(
          this, _$identity);
}

abstract class _CommandDefinition implements CommandDefinition {
  const factory _CommandDefinition(
          final String command,
          final String description,
          final FutureOr<void> Function(TerminalContext) run) =
      _$_CommandDefinition;

  @override
  String get command;
  @override
  String get description;
  @override
  FutureOr<void> Function(TerminalContext) get run;
  @override
  @JsonKey(ignore: true)
  _$$_CommandDefinitionCopyWith<_$_CommandDefinition> get copyWith =>
      throw _privateConstructorUsedError;
}
