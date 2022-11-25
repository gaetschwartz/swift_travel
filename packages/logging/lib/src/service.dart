import 'dart:collection';
import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'consumer.dart';
import 'models.dart';

abstract class Logger {
  static final root = ScopedLogger._(
    consumers: [const ConsoleLogger()],
    scope: Scope.empty,
  );

  const Logger._();

  factory Logger.of(
    String scope0, [
    String? scope1,
    String? scope2,
    String? scope3,
    String? scope4,
    String? scope5,
    String? scope6,
    String? scope7,
    String? scope8,
    String? scope9,
  ]) {
    return Logger.fromScope(Scope([
      scope0,
      if (scope1 != null) scope1,
      if (scope2 != null) scope2,
      if (scope3 != null) scope3,
      if (scope4 != null) scope4,
      if (scope5 != null) scope5,
      if (scope6 != null) scope6,
      if (scope7 != null) scope7,
      if (scope8 != null) scope8,
      if (scope9 != null) scope9,
    ]));
  }

  factory Logger(
    String scope0, [
    String? scope1,
    String? scope2,
    String? scope3,
    String? scope4,
    String? scope5,
    String? scope6,
    String? scope7,
    String? scope8,
    String? scope9,
  ]) {
    return Logger.fromScope(Scope([
      scope0,
      if (scope1 != null) scope1,
      if (scope2 != null) scope2,
      if (scope3 != null) scope3,
      if (scope4 != null) scope4,
      if (scope5 != null) scope5,
      if (scope6 != null) scope6,
      if (scope7 != null) scope7,
      if (scope8 != null) scope8,
      if (scope9 != null) scope9,
    ]));
  }

  static final _registery = <Scope, ScopedLogger>{};

  static ScopedLogger fromScope(Scope scope) {
    // asset that the snope is not empty
    assert(scope.value.isNotEmpty);
    // assert that each scope path doesn't contain any of "./\:"
    assert(scope.value.every((e) => !e.contains(RegExp(r'[./\\:]'))),
        'Scope path cannot contain any of "./\\:"');
    final parent = firstParentOfScope(scope);
    return _registery.putIfAbsent(scope, () {
      return ScopedLogger._(
        consumers: parent.consumers,
        scope: scope,
      );
    });
  }

  static ScopedLogger firstParentOfScope(Scope scope) {
    // asset that the snope is not empty
    assert(scope.value.isNotEmpty);

    Scope parentScope = scope;
    while (parentScope.value.isNotEmpty) {
      parentScope = parentScope.parent;
      if (_registery.containsKey(parentScope)) {
        return _registery[parentScope]!;
      }
    }
    return root;
  }

  void clearRegistry() {
    _registery.clear();
  }

  /// Register multiple consumers
  void registerAll(Iterable<LogConsumer> e);

  /// Register a consumer
  void register(LogConsumer l);

  void setConsumers(List<LogConsumer> list);

  List<LogConsumer> get consumers;

  void _consume(LogMessage msg) {
    for (final c in consumers) {
      c.consume(msg);
    }
  }

  Scope get scope;

  void log(
    Object? message, {
    LogLevel level = LogLevel.info,
    String? channel,
  });

  Future<T> future<T extends Object?>(Future<T> future,
      {String? channel, LogLevel level = LogLevel.info});

  /// Log a serious crash, if possible
  void crash(String e, {String? channel});

  /// Log an error, like if something is thrown
  void e(String e, {String? channel, StackTrace? stackTrace});

  /// Log an info
  void i(String msg, {String? channel});

  /// Log a debug message
  void d(String msg, {String? channel});

  void json(
    Object? json, {
    String? indent,
    String? channel,
    LogLevel level = LogLevel.info,
  });

  void w(String s);

  /// Log a message
}

// This class doesn't have a channel as it's scoped
class ScopedLogger extends Logger {
  ScopedLogger._({
    required List<LogConsumer> consumers,
    required Scope scope,
  })  : _scope = scope,
        _consumers = List.of(consumers),
        super._();

  final Scope _scope;
  final List<LogConsumer> _consumers;

  ScopedLogger child(String name) => Logger.fromScope(_scope / name);

  /// Register multiple consumers
  @override
  void registerAll(Iterable<LogConsumer> e) => _consumers.addAll(e);

  /// Register a consumer
  @override
  void register(LogConsumer l) => _consumers.add(l);

  @override
  void setConsumers(List<LogConsumer> list) => _consumers
    ..clear()
    ..addAll(list);

  @override
  List<LogConsumer> get consumers => UnmodifiableListView(_consumers);

  @override
  void log(
    Object? message, {
    LogLevel level = LogLevel.info,
    String? channel,
  }) =>
      _log(message.toString(), channel: channel, level: level);

  @override
  Future<T> future<T extends Object?>(Future<T> future,
      {String? channel, LogLevel level = LogLevel.info}) async {
    final s = Stopwatch()..start();
    final res = await future;
    s.stop();
    _log('(${s.elapsedMilliseconds} ms): $res', channel: channel, level: level);
    return res;
  }

  /// Log a serious crash, if possible
  @override
  void crash(String e, {String? channel}) =>
      _log(e, level: LogLevel.crash, channel: channel);

  /// Log an error, like if something is thrown
  @override
  void e(String e, {String? channel, StackTrace? stackTrace}) {
    _log(e, level: LogLevel.error, channel: channel);
    if (stackTrace != null) debugPrintStack(stackTrace: stackTrace);
  }

  // Log an info
  @override
  void i(String msg, {String? channel}) =>
      _log(msg, channel: channel, level: LogLevel.info);

  @override
  void d(String msg, {String? channel}) =>
      _log(msg, level: LogLevel.debug, channel: channel);

  @override
  void json(
    Object? json, {
    String? indent,
    String? channel,
    LogLevel level = LogLevel.info,
  }) =>
      _log(
        JsonEncoder.withIndent(indent).convert(json),
        channel: channel,
        level: level,
      );

  /// Log a message
  void _log(
    final String message, {
    required final LogLevel level,
    final String? channel,
  }) {
    final msg = LogMessage(
      message: message,
      scope: channel != null ? _scope / channel : _scope,
      timestamp: DateTime.now(),
      level: level,
    );

    _consume(msg);
  }

  @override
  Scope get scope => _scope;

  @override
  void w(String s) {
    _log(s, level: LogLevel.warning);
  }
}
