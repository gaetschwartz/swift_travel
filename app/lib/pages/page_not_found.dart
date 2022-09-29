import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PageNotFound extends StatefulWidget {
  const PageNotFound({
    required this.settings,
    Key? key,
  }) : super(key: key);

  final RouteSettings settings;

  @override
  _PageNotFoundState createState() => _PageNotFoundState();
}

class _PageNotFoundState extends State<PageNotFound> {
  bool _wrapped = true;
  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Page not found'),
            leading: const CloseButton(),
            actions: [
              IconButton(
                  icon: _wrapped
                      ? const Icon(Icons.wrap_text)
                      : const Icon(CupertinoIcons.text_badge_checkmark),
                  onPressed: () => setState(() => _wrapped = !_wrapped))
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              children: [
                ErrorDataWidget(
                  'Name:',
                  widget.settings.name,
                  wrapped: _wrapped,
                ),
                ErrorDataWidget(
                  'Arguments:',
                  widget.settings.arguments.toString(),
                  wrapped: _wrapped,
                ),
                ErrorDataWidget(
                  'Arguments type:',
                  widget.settings.arguments.runtimeType.toString(),
                  wrapped: _wrapped,
                ),
                ErrorDataWidget(
                  'StackTrace:',
                  StackTrace.current.toString(),
                  wrapped: _wrapped,
                ),
              ],
            ),
          ),
        ),
      );
}

class ErrorDataWidget extends StatelessWidget {
  const ErrorDataWidget(
    this.name,
    this.value, {
    Key? key,
    this.wrapped = true,
  }) : super(key: key);

  final String name;
  final String? value;
  final bool wrapped;

  @override
  Widget build(BuildContext context) {
    final text = Text(value!,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontFamily: GoogleFonts.firaCode().fontFamily));
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name, style: Theme.of(context).textTheme.bodyLarge),
          const Gap(4),
          Card(
            color: Colors.grey[100],
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                width: double.infinity,
                child: wrapped
                    ? text
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: text,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
