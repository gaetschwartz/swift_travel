import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future<DateTime?> pickDate(
  BuildContext context, {
  DateTime? minimumDate,
  DateTime? initialDateTime,
  DateTime? maximumDate,
  Widget cancel = const Text('Cancel'),
  Widget submit = const Text('Submit'),
  Widget? bottom,
  bool center = true,
  int? minuteInterval,
  Color? textColor,
}) async =>
    await showCupertinoModalPopup<DateTime>(
      context: context,
      barrierDismissible: true,
      builder: (context) => _DatePicker(
        bottom: bottom,
        initialDateTime: initialDateTime,
        maximumDate: maximumDate,
        minimumDate: minimumDate,
        cancel: cancel,
        submit: submit,
        center: center,
        minuteInterval: minuteInterval,
        textColor: textColor,
      ),
    ) ??
    initialDateTime;

class _DatePicker extends StatefulWidget {
  const _DatePicker({
    required this.minimumDate,
    required this.initialDateTime,
    required this.maximumDate,
    required this.cancel,
    required this.submit,
    required this.center,
    required this.minuteInterval,
    required this.bottom,
    required this.textColor,
  });

  final DateTime? minimumDate;
  final DateTime? initialDateTime;
  final DateTime? maximumDate;
  final Widget cancel;
  final Widget submit;
  final bool center;
  final int? minuteInterval;
  final Widget? bottom;
  final Color? textColor;

  @override
  __DatePickerState createState() => __DatePickerState();
}

const double _kPickerSheetHeight = 216;
const double _kPickerSheetWidth = 400;

class __DatePickerState extends State<_DatePicker> {
  DateTime? _time;

  @override
  Widget build(BuildContext context) {
    final actionTextStyle = CupertinoTheme.of(context).textTheme.actionTextStyle;
    final datePicker = Padding(
      padding: const EdgeInsets.all(8),
      child: CupertinoTheme(
        data: CupertinoThemeData(brightness: Theme.of(context).brightness),
        child: Container(
          decoration: BoxDecoration(
              color: CupertinoTheme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          constraints: const BoxConstraints(maxWidth: _kPickerSheetWidth),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      onPressed: () => Navigator.of(context).pop(null),
                      child: DefaultTextStyle(
                        style: actionTextStyle.copyWith(color: widget.textColor),
                        child: widget.cancel,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () => Navigator.of(context).pop(_time),
                      child: DefaultTextStyle(
                        style: actionTextStyle.copyWith(
                            fontWeight: FontWeight.bold, color: widget.textColor),
                        child: widget.submit,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _kPickerSheetHeight,
                  child: CupertinoDatePicker(
                    minuteInterval: widget.minuteInterval!,
                    minimumDate: widget.minimumDate,
                    initialDateTime: widget.initialDateTime,
                    maximumDate: widget.maximumDate,
                    use24hFormat: true,
                    onDateTimeChanged: (value) => setState(() => _time = value),
                  ),
                ),
                if (widget.bottom != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: widget.bottom,
                  )
              ],
            ),
          ),
        ),
      ),
    );
    return widget.center ? Center(child: datePicker) : datePicker;
  }
}
