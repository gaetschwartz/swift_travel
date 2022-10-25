import 'dart:async';
import 'dart:math' as math;

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gaets_logging/logging.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swift_travel/terminal/models.dart';

class TerminalPage extends StatelessWidget {
  const TerminalPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Theme(
        data: ThemeData.dark(),
        child: const ProviderScope(
          child: TerminalWidget(),
        ),
      ),
    );
  }
}

class TerminalWidget extends ConsumerStatefulWidget {
  const TerminalWidget({
    Key? key,
  }) : super(key: key);

  @override
  _TerminalWidgetState createState() => _TerminalWidgetState();
}

final terminalHistoryProvider =
    StateProvider.autoDispose((ref) => <TerminalCommandResult>[]);

class _TerminalWidgetState extends ConsumerState<TerminalWidget> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  final int cache = 25;
  final log = Logger.of('TerminalWidget');

  void write(String cmd, String result) {
    final history = ref.read(terminalHistoryProvider.state);
    final newList = List<TerminalCommandResult>.of(history.state);
    if (history.state.length > cache) {
      newList.removeRange(0, newList.length - cache);
    }
    newList.add(TerminalCommandResult(cmd, result));
    history.state = newList;

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => unawaited(scrollBottom()),
    );
  }

  Future<void> scrollBottom() {
    return scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 250),
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  void clear() => ref.read(terminalHistoryProvider.state).state = [];

  final maxLength =
      commands.map<int>((e) => e.command.length).fold(0, math.max);

  Future<void> handleCommand(String txt) async {
    final s = txt.trim().toLowerCase().split(' ');
    final def =
        commands.firstWhereOrNull((element) => element.command == s.first);
    if (def == null) {
      if (s.first == 'help') {
        write(s.first,
            "Here are the available commands : \n\n${commands.map((c) => "  ${c.command}:${" " * (maxLength + 2 - c.command.length)}${c.description}").join("\n")}");
      } else {
        write(s.first, 'Unknown command `${s.first}`, try `help` for help.');
      }
    } else {
      def.run(
        TerminalContext(
            s, write, ref.read(terminalHistoryProvider.state), context),
      );
    }
    controller.text = '';
  }

  @override
  void dispose() {
    scrollController.dispose();
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => unawaited(scrollBottom()));
  }

  @override
  Widget build(BuildContext context) {
    final firaCode =
        GoogleFonts.firaCode(textStyle: Theme.of(context).textTheme.bodyLarge);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: DefaultTextStyle(
          style: firaCode,
          child: GestureDetector(
            onTap: () {
              log.log('Requesting focus');
              if (!focusNode.hasFocus) focusNode.requestFocus();
            },
            child: Consumer(builder: (context, w, _) {
              final commands = w.watch(terminalHistoryProvider);
              return ListView.builder(
                controller: scrollController,
                itemCount: commands.length + 1,
                itemBuilder: (context, i) {
                  if (i == commands.length) {
                    return PrompTextField(
                      firaCode: firaCode,
                      focusNode: focusNode,
                      text: controller,
                      handleCommand: handleCommand,
                      key: const ValueKey('terminal-prompt-textfield'),
                    );
                  }
                  final terminalCommandResult = commands[i];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Prompt(),
                          Text(terminalCommandResult.command)
                        ],
                      ),
                      Text(terminalCommandResult.result),
                    ],
                  );
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}

class PrompTextField extends StatefulWidget {
  const PrompTextField({
    Key? key,
    required this.firaCode,
    required this.focusNode,
    required this.text,
    required this.handleCommand,
  }) : super(key: key);

  final TextStyle firaCode;
  final FocusNode focusNode;
  final TextEditingController text;
  final void Function(String) handleCommand;

  @override
  State<PrompTextField> createState() => _PrompTextFieldState();
}

class _PrompTextFieldState extends State<PrompTextField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Prompt(),
        Expanded(
          child: TextField(
            style: widget.firaCode,
            focusNode: widget.focusNode,
            autofocus: true,
            controller: widget.text,
            cursorWidth: 8,
            cursorColor: const Color(0xff5DEDCB),
            textInputAction: TextInputAction.send,
            onSubmitted: (s) {
              widget.handleCommand(s);

              WidgetsBinding.instance
                  .addPostFrameCallback((_) => widget.focusNode.requestFocus());
            },
            decoration: const InputDecoration(
              isCollapsed: true,
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}

class Prompt extends StatelessWidget {
  const Prompt({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const fontSize = 14.0;

    return Text.rich(TextSpan(children: [
      TextSpan(
        text: 'gaetan@work',
        style: GoogleFonts.firaCode(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          color: const Color(0xFF8AE232),
          letterSpacing: 1,
          fontSize: fontSize,
        ),
      ),
      TextSpan(
        text: ':',
        style: GoogleFonts.firaCode(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          letterSpacing: 1,
          fontSize: fontSize,
        ),
      ),
      TextSpan(
        text: '~',
        style: GoogleFonts.firaCode(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          color: const Color(0xFF8AE232),
          letterSpacing: 1,
          fontSize: fontSize,
        ),
      ),
      TextSpan(
        text: r'$ ',
        style: GoogleFonts.firaCode(
          textStyle: Theme.of(context).textTheme.bodyLarge,
          letterSpacing: 1,
          fontSize: fontSize,
        ),
      ),
    ]));
  }
}
