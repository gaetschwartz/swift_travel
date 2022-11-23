import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:swift_travel/l10n/app_localizations.dart';
import 'package:swift_travel/states/route_textfield_state.dart';

class LocationTextBoxManager extends ChangeNotifier {
  RouteTextfieldState _state;

  RouteTextfieldState get state => _state;

  set state(RouteTextfieldState value) {
    _state = value;
    notifyListeners();
  }

  final TextEditingController controller;
  final String currentLocation;

  LocationTextBoxManager({
    RouteTextfieldState initialState = const RouteTextfieldState.text(''),
    required this.currentLocation,
  })  : _state = initialState,
        controller = TextEditingController(
            text: _stateToString(initialState, currentLocation));

  static String _stateToString(
    RouteTextfieldState state,
    String currentLocation,
  ) {
    return state.when(
      empty: () => '',
      text: (s, doLoad) => s,
      useCurrentLocation: () => currentLocation,
    );
  }

  void clear() {
    _state = const RouteTextfieldState.empty();
    controller.clear();
    notifyListeners();
  }

  void setString(String s, {bool doLoad = true}) {
    _state = RouteTextfieldState.text(s, doLoad: doLoad);
    controller.text = s;
    notifyListeners();
  }

  void useCurrentLocation() {
    _state = const RouteTextfieldState.useCurrentLocation();
    controller.text = currentLocation;
    notifyListeners();
  }

  String get text => controller.text;

  static String computeCurrentLocation(BuildContext context) =>
      AppLocalizations.of(context).current_location;

  LocationTextBoxFormatter get inputFormatter => LocationTextBoxFormatter._(
        currentLocation: currentLocation,
        setState: (state) {
          _state = state;
          notifyListeners();
        },
      );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class LocationTextBoxFormatter extends TextInputFormatter {
  LocationTextBoxFormatter._({
    required this.currentLocation,
    required this.setState,
  });

  final String currentLocation;
  final void Function(RouteTextfieldState state) setState;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length != oldValue.text.length &&
        oldValue.text == currentLocation) {
      setState(const RouteTextfieldState.empty());
      return TextEditingValue.empty;
    } else {
      return newValue;
    }
  }
}
