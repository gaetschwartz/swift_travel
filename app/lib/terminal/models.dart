import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';

typedef Writer = void Function(String cmd, String res);

@freezed
class TerminalContext with _$TerminalContext {
  const factory TerminalContext(
    List<String> command,
    Writer w,
    StateController<List<TerminalCommandResult>> stateController,
    BuildContext context,
  ) = _TerminalContext;
}

@freezed
class TerminalCommandResult with _$TerminalCommandResult {
  const factory TerminalCommandResult(String command, String result) = _TerminalCommandResult;
}

@freezed
class CommandDefinition with _$CommandDefinition {
  const factory CommandDefinition(
    String command,
    String description,
    FutureOr<void> Function(TerminalContext c) run,
  ) = _CommandDefinition;
}

final commands = [
  CommandDefinition("hello", "Hello World command !", (c) => c.w("hello", "Hello")),
  CommandDefinition("whoami", "Who am I ??", (c) => c.w("whoami", "Gaëtan Schwartz")),
  CommandDefinition("clear", "Clear the console", (c) => c.stateController.state = []),
];
