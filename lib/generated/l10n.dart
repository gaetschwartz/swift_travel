// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class Strings {
  Strings();
  
  static Strings current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<Strings> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      Strings.current = Strings();
      
      return Strings.current;
    });
  } 

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  /// `Arrival`
  String get arrival {
    return Intl.message(
      'Arrival',
      name: 'arrival',
      desc: '',
      args: [],
    );
  }

  /// `Brightness`
  String get brightness {
    return Intl.message(
      'Brightness',
      name: 'brightness',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get brightness_dark {
    return Intl.message(
      'Dark',
      name: 'brightness_dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get brightness_light {
    return Intl.message(
      'Light',
      name: 'brightness_light',
      desc: '',
      args: [],
    );
  }

  /// `System`
  String get brightness_system {
    return Intl.message(
      'System',
      name: 'brightness_system',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Starting point`
  String get departure {
    return Intl.message(
      'Starting point',
      name: 'departure',
      desc: '',
      args: [],
    );
  }

  /// `Developer`
  String get developer {
    return Intl.message(
      'Developer',
      name: 'developer',
      desc: '',
      args: [],
    );
  }

  /// `Maps app`
  String get maps_app {
    return Intl.message(
      'Maps app',
      name: 'maps_app',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Navigation API`
  String get navigation_api {
    return Intl.message(
      'Navigation API',
      name: 'navigation_api',
      desc: '',
      args: [],
    );
  }

  /// `Our team`
  String get our_team {
    return Intl.message(
      'Our team',
      name: 'our_team',
      desc: '',
      args: [],
    );
  }

  /// `Remove from favourites`
  String get remove_from_favoruites {
    return Intl.message(
      'Remove from favourites',
      name: 'remove_from_favoruites',
      desc: '',
      args: [],
    );
  }

  /// `Reset settings`
  String get reset_settings {
    return Intl.message(
      'Reset settings',
      name: 'reset_settings',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Favourites`
  String get tabs_favourites {
    return Intl.message(
      'Favourites',
      name: 'tabs_favourites',
      desc: '',
      args: [],
    );
  }

  /// `Itinerary`
  String get tabs_route {
    return Intl.message(
      'Itinerary',
      name: 'tabs_route',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get tabs_search {
    return Intl.message(
      'Search',
      name: 'tabs_search',
      desc: '',
      args: [],
    );
  }

  /// `Use current location`
  String get use_current_location {
    return Intl.message(
      'Use current location',
      name: 'use_current_location',
      desc: '',
      args: [],
    );
  }

  /// `Use current time`
  String get use_current_time {
    return Intl.message(
      'Use current time',
      name: 'use_current_time',
      desc: '',
      args: [],
    );
  }

  /// `Rename`
  String get rename {
    return Intl.message(
      'Rename',
      name: 'rename',
      desc: '',
      args: [],
    );
  }

  /// `What to do ?`
  String get what_to_do {
    return Intl.message(
      'What to do ?',
      name: 'what_to_do',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Travel duration`
  String get travel_duration {
    return Intl.message(
      'Travel duration',
      name: 'travel_duration',
      desc: '',
      args: [],
    );
  }

  /// `You arrive at *{time}*.`
  String youll_be_there(Object time) {
    return Intl.message(
      'You arrive at *$time*.',
      name: 'youll_be_there',
      desc: '',
      args: [time],
    );
  }

  /// `Save route`
  String get fav_route {
    return Intl.message(
      'Save route',
      name: 'fav_route',
      desc: '',
      args: [],
    );
  }

  /// `Walk *{walk}* and wait *{wait}*.`
  String walk_and_wait(Object walk, Object wait) {
    return Intl.message(
      'Walk *$walk* and wait *$wait*.',
      name: 'walk_and_wait',
      desc: '',
      args: [walk, wait],
    );
  }

  /// `Walk *{walk}*.`
  String walk(Object walk) {
    return Intl.message(
      'Walk *$walk*.',
      name: 'walk',
      desc: '',
      args: [walk],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Destination`
  String get destination {
    return Intl.message(
      'Destination',
      name: 'destination',
      desc: '',
      args: [],
    );
  }

  /// `Find a route`
  String get find_a_route {
    return Intl.message(
      'Find a route',
      name: 'find_a_route',
      desc: '',
      args: [],
    );
  }

  /// `Add to favourites`
  String get add_to_favs {
    return Intl.message(
      'Add to favourites',
      name: 'add_to_favs',
      desc: '',
      args: [],
    );
  }

  /// `Themes`
  String get themes {
    return Intl.message(
      'Themes',
      name: 'themes',
      desc: '',
      args: [],
    );
  }

  /// `Search for a station`
  String get search_station {
    return Intl.message(
      'Search for a station',
      name: 'search_station',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_ {
    return Intl.message(
      'Continue',
      name: 'continue_',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get from {
    return Intl.message(
      'From',
      name: 'from',
      desc: '',
      args: [],
    );
  }

  /// `to`
  String get to {
    return Intl.message(
      'to',
      name: 'to',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Delete favourite ?`
  String get delete_fav {
    return Intl.message(
      'Delete favourite ?',
      name: 'delete_fav',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'it'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}